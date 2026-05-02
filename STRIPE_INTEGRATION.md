# Stripe Payment Integration

**Note:** The URL `/order/` now redirects to **Get the book** (`/get-the-book.html`) so there is a single purchase entry point. An older in-browser Stripe + print-job demo used to live on the order page; recover it from git history for `docs/order.md` if needed.

## Overview

The following described an optional self-hosted checkout flow (Stripe Elements, Payment Intents, and a backend worker). It is not present on the live order page today.

## Frontend Implementation

### Features
- **Stripe Elements**: Secure card input that never touches your servers
- **Real-time validation**: Card errors displayed immediately
- **Order summary**: Dynamic calculation of subtotal, shipping, and total
- **Payment Intent flow**: Uses Stripe's recommended Payment Intent API
- **Error handling**: Comprehensive error messages for payment failures

### Configuration Required

When you host the checkout UI yourself (for example by restoring the old `docs/order.md` from git), configure the JavaScript constants that were embedded in that page, for example:

1. **Stripe Publishable Key**: 
   ```javascript
   stripePublishableKey: "pk_test_REPLACE_WITH_YOUR_STRIPE_PUBLISHABLE_KEY"
   ```
   - Get from: https://dashboard.stripe.com/apikeys
   - Use `pk_test_...` for testing, `pk_live_...` for production

2. **Payment Intent Endpoint**:
   ```javascript
   createPaymentIntentEndpoint: "https://YOUR-WORKER.your-subdomain.workers.dev/create-payment-intent"
   ```

3. **Pricing**:
   ```javascript
   pricing: {
       paperback: {
           basePrice: 2000, // $20.00 in cents
           podPackageId: "REPLACE_WITH_POD_PACKAGE_ID_PAPERBACK"
       },
       hardcover: {
           basePrice: 3500, // $35.00 in cents
           podPackageId: "REPLACE_WITH_POD_PACKAGE_ID_HARDCOVER"
       }
   }
   ```

4. **Shipping Costs**:
   ```javascript
   shipping: {
       MAIL: 500,    // $5.00
       PRIORITY: 1000, // $10.00
       EXPRESS: 2000   // $20.00
   }
   ```

## Backend Requirements

You need to implement two backend endpoints:

### 1. Create Payment Intent Endpoint

**Endpoint**: `POST /create-payment-intent`

**Request Body**:
```json
{
  "amount": 2500,  // Total in cents
  "currency": "usd",
  "metadata": {
    "order_type": "book_print"
  }
}
```

**Response**:
```json
{
  "clientSecret": "pi_xxx_secret_xxx"
}
```

**Implementation Example (Cloudflare Worker)**:
```javascript
export default {
  async fetch(request, env) {
    if (request.method !== 'POST') {
      return new Response('Method not allowed', { status: 405 });
    }

    const { amount, currency = 'usd', metadata } = await request.json();

    // Initialize Stripe with secret key from environment
    const stripe = require('stripe')(env.STRIPE_SECRET_KEY);

    try {
      const paymentIntent = await stripe.paymentIntents.create({
        amount: amount,
        currency: currency,
        metadata: metadata || {},
        automatic_payment_methods: {
          enabled: true,
        },
      });

      return new Response(JSON.stringify({
        clientSecret: paymentIntent.client_secret
      }), {
        headers: { 'Content-Type': 'application/json' },
      });
    } catch (error) {
      return new Response(JSON.stringify({
        error: error.message
      }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }
  }
};
```

### 2. Create Print Job Endpoint (Updated)

**Endpoint**: `POST /create-print-job` (or your existing endpoint)

**Request Body** (now includes `payment_intent_id`):
```json
{
  "order_id": "web-1234567890-abc123",
  "payment_intent_id": "pi_xxx",
  "contact_email": "customer@example.com",
  "pod_package_id": "REPLACE_WITH_POD_PACKAGE_ID_PAPERBACK",
  "quantity": 1,
  "title": "Interfaces of Reality",
  "shipping_level": "MAIL",
  "shipping_address": {
    "name": "John Doe",
    "phone_number": "+1234567890",
    "street1": "123 Main St",
    "street2": "Apt 4B",
    "city": "New York",
    "state_code": "NY",
    "postcode": "10001",
    "country_code": "US"
  },
  "interior_source_url": "https://YOUR_HOSTING/interior.pdf",
  "cover_source_url": "https://YOUR_HOSTING/cover.pdf"
}
```

**Backend should**:
1. Verify the payment intent was successful using Stripe API
2. Only create the Lulu print job if payment succeeded
3. Handle refunds if Lulu order fails

**Implementation Example**:
```javascript
export default {
  async fetch(request, env) {
    if (request.method !== 'POST') {
      return new Response('Method not allowed', { status: 405 });
    }

    const payload = await request.json();
    const stripe = require('stripe')(env.STRIPE_SECRET_KEY);

    try {
      // Verify payment intent
      const paymentIntent = await stripe.paymentIntents.retrieve(
        payload.payment_intent_id
      );

      if (paymentIntent.status !== 'succeeded') {
        return new Response(JSON.stringify({
          error: 'Payment not completed'
        }), {
          status: 400,
          headers: { 'Content-Type': 'application/json' },
        });
      }

      // Create Lulu print job (your existing Lulu API code)
      const luluResponse = await createLuluPrintJob(payload);

      return new Response(JSON.stringify({
        success: true,
        lulu_order_id: luluResponse.id,
        payment_intent_id: payload.payment_intent_id
      }), {
        headers: { 'Content-Type': 'application/json' },
      });
    } catch (error) {
      // If Lulu fails, consider refunding
      // await stripe.refunds.create({ payment_intent: payload.payment_intent_id });
      
      return new Response(JSON.stringify({
        error: error.message
      }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      });
    }
  }
};
```

## Security Notes

1. **Never expose Stripe secret key** in frontend code
2. **Always verify payment** on backend before creating orders
3. **Use HTTPS** for all payment-related endpoints
4. **Store secret keys** in environment variables, not in code
5. **Implement webhooks** to handle payment status changes (optional but recommended)

## Testing

### Test Cards (Stripe Test Mode)

- **Success**: `4242 4242 4242 4242`
- **Decline**: `4000 0000 0000 0002`
- **3D Secure**: `4000 0025 0000 3155`

Use any future expiry date, any CVC, and any ZIP code.

### Test Flow

1. Fill out order form
2. Use test card `4242 4242 4242 4242`
3. Complete payment
4. Verify order is created in Lulu

## Production Checklist

- [ ] Replace test publishable key with live key
- [ ] Update backend to use live Stripe secret key
- [ ] Set correct pricing for paperback and hardcover
- [ ] Set correct shipping costs
- [ ] Update Lulu package IDs
- [ ] Test with real payment (small amount)
- [ ] Set up Stripe webhooks for payment status updates
- [ ] Implement refund logic for failed Lulu orders
- [ ] Add order confirmation email
- [ ] Add error logging and monitoring

## Additional Resources

- [Stripe Payment Intents Guide](https://stripe.com/docs/payments/payment-intents)
- [Stripe Elements Documentation](https://stripe.com/docs/stripe-js)
- [Stripe Testing Guide](https://stripe.com/docs/testing)
- [Stripe Webhooks](https://stripe.com/docs/webhooks)

