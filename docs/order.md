---
layout: default
title: Order the Book
permalink: /order/
---

<div class="page-header">
    <h1>Order the book</h1>
    <p style="color: #666; font-size: 1.1em; margin-top: 10px;">
        The paperback is available on <strong>Amazon</strong>. Use the link below for the fastest checkout and shipping options in your region.
        The form further down is an optional path for direct print-on-demand ordering through this site once your backend is configured (Stripe and a secure worker).
    </p>
</div>

<style>
    .order-container {
        max-width: 900px;
        margin: 0 auto;
        padding: 20px;
    }

    .order-section {
        background: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 24px;
        margin-bottom: 24px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }

    .order-section h2 {
        margin-top: 0;
        margin-bottom: 20px;
        color: #333;
        font-size: 1.5em;
        border-bottom: 2px solid #f0f0f0;
        padding-bottom: 10px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 16px;
    }

    @media (min-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr 1fr;
        }
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }

    .form-group.full-width {
        grid-column: 1 / -1;
    }

    .form-group label {
        margin-bottom: 6px;
        font-weight: 600;
        color: #555;
        font-size: 0.95em;
    }

    .form-group label .required {
        color: #d32f2f;
        margin-left: 2px;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1em;
        font-family: inherit;
        transition: border-color 0.2s;
    }

    .form-group input:focus,
    .form-group select:focus {
        outline: none;
        border-color: #1976d2;
        box-shadow: 0 0 0 2px rgba(25, 118, 210, 0.1);
    }

    .form-group input[type="number"] {
        -moz-appearance: textfield;
    }

    .form-group input[type="number"]::-webkit-inner-spin-button,
    .form-group input[type="number"]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    .button-group {
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
        margin-top: 20px;
    }

    .btn {
        padding: 12px 24px;
        border: none;
        border-radius: 4px;
        font-size: 1em;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s;
        font-family: inherit;
    }

    .btn-primary {
        background: #1976d2;
        color: white;
    }

    .btn-primary:hover:not(:disabled) {
        background: #1565c0;
        transform: translateY(-1px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    }

    .btn-primary:disabled {
        background: #ccc;
        cursor: not-allowed;
        opacity: 0.6;
    }

    .btn-secondary {
        background: #f5f5f5;
        color: #333;
        border: 1px solid #ddd;
    }

    .btn-secondary:hover:not(:disabled) {
        background: #e0e0e0;
    }

    .status-console {
        background: #1e1e1e;
        color: #d4d4d4;
        padding: 16px;
        border-radius: 4px;
        font-family: 'Courier New', monospace;
        font-size: 0.9em;
        line-height: 1.5;
        max-height: 400px;
        overflow-y: auto;
        white-space: pre-wrap;
        word-wrap: break-word;
        margin-top: 20px;
    }

    .status-console.success {
        border-left: 4px solid #4caf50;
    }

    .status-console.error {
        border-left: 4px solid #f44336;
    }

    .status-console.info {
        border-left: 4px solid #2196f3;
    }

    .status-console:empty {
        display: none;
    }

    /* Stripe Elements styling */
    .StripeElement {
        box-sizing: border-box;
        height: 40px;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: white;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    .StripeElement--focus {
        border-color: #1976d2;
        box-shadow: 0 0 0 2px rgba(25, 118, 210, 0.1);
    }

    .StripeElement--invalid {
        border-color: #d32f2f;
    }

    .StripeElement--webkit-autofill {
        background-color: #fefde5 !important;
    }

    .payment-loading {
        opacity: 0.6;
        pointer-events: none;
    }
</style>

<div class="order-container">
    <div class="order-section">
        <h2>Buy on Amazon</h2>
        <p style="color: #555; margin-bottom: 20px; line-height: 1.6;">
            <em>Interfaces of Reality</em> (paperback, English) is in stock on Amazon. ISBN-13: <strong>978-1105833892</strong>.
        </p>
        <p style="margin-bottom: 24px;">
            <a href="https://a.co/d/0hU5Ff4j"
               target="_blank"
               rel="noopener noreferrer"
               class="amazon-button">
                <svg width="28" height="28" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                    <path d="M7 18c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12L8.1 13h7.45c.75 0 1.41-.41 1.75-1.03L21.7 4H5.21l-.94-2H1zm16 16c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
                </svg>
                <span>Buy on Amazon</span>
            </a>
        </p>
        <p style="color: #666; font-size: 0.95em; margin: 0;">
            Opens the product page in a new tab: <a href="https://a.co/d/0hU5Ff4j" target="_blank" rel="noopener noreferrer">https://a.co/d/0hU5Ff4j</a>
        </p>
    </div>

    <div class="order-section">
        <h2>Direct print order (optional)</h2>
        <p style="color: #666; margin-bottom: 16px; line-height: 1.6;">
            The form below is for print-on-demand checkout through your own endpoint when it is wired up. Payment and shipping are never handled in the browser alone: configure the Stripe and worker URLs in the script before accepting real orders.
        </p>
    </div>

    <form id="orderForm">
        <!-- Section A: Choose format -->
        <div class="order-section">
            <h2>Choose Format</h2>
            <div class="form-grid">
                <div class="form-group">
                    <label for="format">Format <span class="required">*</span></label>
                    <select id="format" name="format" required>
                        <option value="">Select format...</option>
                        <option value="REPLACE_WITH_POD_PACKAGE_ID_PAPERBACK">Paperback</option>
                        <option value="REPLACE_WITH_POD_PACKAGE_ID_HARDCOVER">Hardcover</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="qty">Quantity <span class="required">*</span></label>
                    <input type="number" id="qty" name="qty" min="1" max="50" value="1" required>
                </div>
                <div class="form-group">
                    <label for="shipping_level">Shipping Level <span class="required">*</span></label>
                    <select id="shipping_level" name="shipping_level" required>
                        <option value="">Select shipping...</option>
                        <option value="MAIL">Mail (Standard)</option>
                        <option value="PRIORITY">Priority</option>
                        <option value="EXPRESS">Express</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="email">Email <span class="required">*</span></label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>
        </div>

        <!-- Section B: Shipping address -->
        <div class="order-section">
            <h2>Shipping Address</h2>
            <div class="form-grid">
                <div class="form-group full-width">
                    <label for="name">Full Name <span class="required">*</span></label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone">
                </div>
                <div class="form-group full-width">
                    <label for="street1">Street Address <span class="required">*</span></label>
                    <input type="text" id="street1" name="street1" required>
                </div>
                <div class="form-group full-width">
                    <label for="street2">Apartment, Suite, etc. (Optional)</label>
                    <input type="text" id="street2" name="street2">
                </div>
                <div class="form-group">
                    <label for="city">City <span class="required">*</span></label>
                    <input type="text" id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="state">State/Province <span class="required">*</span></label>
                    <input type="text" id="state" name="state" required>
                </div>
                <div class="form-group">
                    <label for="postcode">Postal Code <span class="required">*</span></label>
                    <input type="text" id="postcode" name="postcode" required>
                </div>
                <div class="form-group">
                    <label for="country">Country <span class="required">*</span></label>
                    <input type="text" id="country" name="country" value="US" maxlength="2" required>
                    <small style="color: #666; margin-top: 4px; display: block;">ISO-2 code (e.g., US, GB, CA)</small>
                </div>
            </div>
        </div>

        <!-- Section C: Payment Summary -->
        <div class="order-section">
            <h2>Order Summary</h2>
            <div id="orderSummary" style="margin-bottom: 20px;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                    <span>Subtotal:</span>
                    <span id="subtotal">$0.00</span>
                </div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                    <span>Shipping:</span>
                    <span id="shippingCost">$0.00</span>
                </div>
                <div style="display: flex; justify-content: space-between; font-size: 1.2em; font-weight: 600; padding-top: 12px; border-top: 2px solid #e0e0e0;">
                    <span>Total:</span>
                    <span id="total">$0.00</span>
                </div>
            </div>
        </div>

        <!-- Section D: Pay -->
        <div class="order-section">
            <h2>Payment</h2>
            <p style="color: #666; margin-bottom: 16px;">
                Secure payment processing powered by Stripe. Your card information is encrypted and never touches our servers.
            </p>
            
            <!-- Stripe Card Element Container -->
            <div id="card-element-container" style="margin-bottom: 20px;">
                <label style="display: block; margin-bottom: 8px; font-weight: 600; color: #555;">
                    Card Details <span class="required">*</span>
                </label>
                <div id="card-element" style="padding: 12px; border: 1px solid #ccc; border-radius: 4px; background: white;">
                    <!-- Stripe Elements will create form elements here -->
                </div>
                <div id="card-errors" role="alert" style="color: #d32f2f; margin-top: 8px; font-size: 0.9em; min-height: 20px;"></div>
            </div>

            <div class="button-group">
                <button type="button" id="processPaymentBtn" class="btn btn-primary" disabled>
                    Pay and Place Order
                </button>
            </div>
        </div>

        <!-- Section D: Status -->
        <div class="order-section">
            <h2>Status</h2>
            <pre id="status" class="status-console"></pre>
        </div>
    </form>
</div>

<!-- Stripe.js - Must be loaded over HTTPS -->
<script src="https://js.stripe.com/v3/"></script>

<script>
    // Security check: Ensure page is served over HTTPS
    if (window.location.protocol !== 'https:' && window.location.hostname !== 'localhost' && window.location.hostname !== '127.0.0.1') {
        // Redirect to HTTPS
        window.location.replace('https:' + window.location.href.substring(window.location.protocol.length));
    }

    // Configuration - REPLACE THESE VALUES BEFORE PRODUCTION
    // 
    // IMPORTANT SECURITY NOTES:
    // - Never call Lulu API directly from browser JavaScript
    // - Lulu requires OAuth 2.0 authentication with client_id and client_secret
    // - Client secrets must NEVER be exposed in browser code
    // - This page calls a secure backend endpoint (Cloudflare Worker/serverless function)
    // - The backend handles all Lulu API authentication and communication
    // - Stripe publishable key is safe to expose in browser (only secret key must be server-side)
    const CONFIG = {
        // Your Cloudflare Worker or serverless function endpoint
        createPrintJobEndpoint: "https://YOUR-WORKER.your-subdomain.workers.dev",
        
        // Stripe configuration
        // Get your publishable key from: https://dashboard.stripe.com/apikeys
        stripePublishableKey: "pk_test_REPLACE_WITH_YOUR_STRIPE_PUBLISHABLE_KEY",
        
        // Backend endpoint to create Stripe payment intent
        // This endpoint should create a PaymentIntent and return { clientSecret: "pi_xxx_secret_xxx" }
        createPaymentIntentEndpoint: "https://YOUR-WORKER.your-subdomain.workers.dev/create-payment-intent",
        
        // Book metadata
        bookTitle: "REPLACE_WITH_YOUR_BOOK_TITLE",
        
        // PDF URLs - host these on your CDN or static hosting
        interiorPdfUrl: "https://YOUR_HOSTING/interior.pdf",
        coverPdfUrl: "https://YOUR_HOSTING/cover.pdf",
        
        // Pricing (in cents) - UPDATE WITH ACTUAL PRICES
        pricing: {
            paperback: {
                basePrice: 2000, // $20.00 in cents
                podPackageId: "REPLACE_WITH_POD_PACKAGE_ID_PAPERBACK"
            },
            hardcover: {
                basePrice: 3500, // $35.00 in cents
                podPackageId: "REPLACE_WITH_POD_PACKAGE_ID_HARDCOVER"
            }
        },
        
        // Shipping costs (in cents)
        shipping: {
            MAIL: 500,    // $5.00
            PRIORITY: 1000, // $10.00
            EXPRESS: 2000   // $20.00
        }
    };

    // Initialize Stripe
    const stripe = Stripe(CONFIG.stripePublishableKey);
    let elements;
    let cardElement;
    let paymentIntentClientSecret = null;

    // State
    let paymentSucceeded = false;
    let currentOrderTotal = 0;

    // DOM elements
    const orderForm = document.getElementById('orderForm');
    const processPaymentBtn = document.getElementById('processPaymentBtn');
    const statusEl = document.getElementById('status');
    const subtotalEl = document.getElementById('subtotal');
    const shippingCostEl = document.getElementById('shippingCost');
    const totalEl = document.getElementById('total');
    const cardErrorsEl = document.getElementById('card-errors');

    // Initialize Stripe Elements
    function initializeStripe() {
        // Security check: Only initialize Stripe over HTTPS
        if (window.location.protocol !== 'https:' && window.location.hostname !== 'localhost' && window.location.hostname !== '127.0.0.1') {
            updateStatus('Error: Stripe requires a secure HTTPS connection. Please access this page via HTTPS.', 'error');
            document.getElementById('card-element-container').style.display = 'none';
            processPaymentBtn.disabled = true;
            return;
        }

        // Check if Stripe is loaded
        if (typeof Stripe === 'undefined') {
            updateStatus('Error: Stripe.js failed to load. Please check your internet connection and try again.', 'error');
            document.getElementById('card-element-container').style.display = 'none';
            processPaymentBtn.disabled = true;
            return;
        }

        elements = stripe.elements();
        
        const style = {
            base: {
                color: '#32325d',
                fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                fontSmoothing: 'antialiased',
                fontSize: '16px',
                '::placeholder': {
                    color: '#aab7c4'
                }
            },
            invalid: {
                color: '#d32f2f',
                iconColor: '#d32f2f'
            }
        };

        cardElement = elements.create('card', { style: style });
        cardElement.mount('#card-element');

        // Handle real-time validation errors from the card Element
        cardElement.on('change', function(event) {
            if (event.error) {
                cardErrorsEl.textContent = event.error.message;
            } else {
                cardErrorsEl.textContent = '';
            }
        });
    }

    // Calculate order total
    function calculateTotal() {
        const format = document.getElementById('format').value;
        const qty = parseInt(document.getElementById('qty').value, 10) || 0;
        const shippingLevel = document.getElementById('shipping_level').value;

        if (!format || qty === 0 || !shippingLevel) {
            subtotalEl.textContent = '$0.00';
            shippingCostEl.textContent = '$0.00';
            totalEl.textContent = '$0.00';
            currentOrderTotal = 0;
            processPaymentBtn.disabled = true;
            return;
        }

        // Get base price
        const formatKey = format === CONFIG.pricing.paperback.podPackageId ? 'paperback' : 'hardcover';
        const basePrice = CONFIG.pricing[formatKey]?.basePrice || 0;
        const shippingCost = CONFIG.shipping[shippingLevel] || 0;

        const subtotal = basePrice * qty;
        const total = subtotal + shippingCost;

        subtotalEl.textContent = formatCurrency(subtotal);
        shippingCostEl.textContent = formatCurrency(shippingCost);
        totalEl.textContent = formatCurrency(total);
        currentOrderTotal = total;

        // Enable payment button if form is valid
        if (orderForm.checkValidity()) {
            processPaymentBtn.disabled = false;
        }
    }

    // Format currency (cents to dollars)
    function formatCurrency(cents) {
        return '$' + (cents / 100).toFixed(2);
    }

    // Create payment intent
    async function createPaymentIntent() {
        try {
            updateStatus('Creating payment intent...', 'info');
            
            const response = await fetch(CONFIG.createPaymentIntentEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    amount: currentOrderTotal,
                    currency: 'usd',
                    metadata: {
                        order_type: 'book_print'
                    }
                })
            });

            if (!response.ok) {
                throw new Error(`Failed to create payment intent: ${response.statusText}`);
            }

            const data = await response.json();
            paymentIntentClientSecret = data.clientSecret;
            
            updateStatus('Payment intent created. Ready to process payment.', 'success');
            return true;
        } catch (error) {
            updateStatus('Error creating payment intent: ' + error.message, 'error');
            return false;
        }
    }

    // Process payment
    async function processPayment() {
        if (!paymentIntentClientSecret) {
            const created = await createPaymentIntent();
            if (!created) {
                return false;
            }
        }

        try {
            processPaymentBtn.disabled = true;
            processPaymentBtn.textContent = 'Processing Payment...';
            orderForm.classList.add('payment-loading');

            updateStatus('Processing payment with Stripe...', 'info');

            const { error, paymentIntent } = await stripe.confirmCardPayment(
                paymentIntentClientSecret,
                {
                    payment_method: {
                        card: cardElement,
                        billing_details: {
                            name: document.getElementById('name').value,
                            email: document.getElementById('email').value,
                            phone: document.getElementById('phone').value,
                            address: {
                                line1: document.getElementById('street1').value,
                                line2: document.getElementById('street2').value || undefined,
                                city: document.getElementById('city').value,
                                state: document.getElementById('state').value,
                                postal_code: document.getElementById('postcode').value,
                                country: document.getElementById('country').value.toUpperCase()
                            }
                        }
                    }
                }
            );

            if (error) {
                updateStatus('Payment failed: ' + error.message, 'error');
                cardErrorsEl.textContent = error.message;
                processPaymentBtn.disabled = false;
                processPaymentBtn.textContent = 'Pay and Place Order';
                orderForm.classList.remove('payment-loading');
                return false;
            }

            if (paymentIntent.status === 'succeeded') {
                paymentSucceeded = true;
                updateStatus('Payment succeeded! Submitting order...', 'success');
                await submitOrder(paymentIntent.id);
                return true;
            }

            return false;
        } catch (error) {
            updateStatus('Error processing payment: ' + error.message, 'error');
            processPaymentBtn.disabled = false;
            processPaymentBtn.textContent = 'Pay and Place Order';
            orderForm.classList.remove('payment-loading');
            return false;
        }
    }

    // Submit order to backend
    async function submitOrder(paymentIntentId) {

        // Get form values
        const format = document.getElementById('format').value;
        const qty = parseInt(document.getElementById('qty').value, 10);
        const shippingLevel = document.getElementById('shipping_level').value;
        const email = document.getElementById('email').value;
        const name = document.getElementById('name').value;
        const phone = document.getElementById('phone').value;
        const street1 = document.getElementById('street1').value;
        const street2 = document.getElementById('street2').value;
        const city = document.getElementById('city').value;
        const state = document.getElementById('state').value;
        const postcode = document.getElementById('postcode').value;
        const country = document.getElementById('country').value.toUpperCase();

        // Validate quantity
        if (qty < 1 || qty > 50) {
            updateStatus('Error: Quantity must be between 1 and 50.', 'error');
            return;
        }

        // Validate country code (ISO-2)
        if (country.length !== 2) {
            updateStatus('Error: Country must be a 2-letter ISO code (e.g., US, GB, CA).', 'error');
            return;
        }

        // Generate order ID
        const timestamp = Date.now();
        const random = Math.random().toString(36).substring(2, 9);
        const orderId = `web-${timestamp}-${random}`;

        // Construct payload
        const payload = {
            order_id: orderId,
            payment_intent_id: paymentIntentId,
            contact_email: email,
            pod_package_id: format,
            quantity: qty,
            title: CONFIG.bookTitle,
            shipping_level: shippingLevel,
            shipping_address: {
                name: name,
                phone_number: phone || undefined,
                street1: street1,
                street2: street2 || undefined,
                city: city,
                state_code: state,
                postcode: postcode,
                country_code: country
            },
            interior_source_url: CONFIG.interiorPdfUrl,
            cover_source_url: CONFIG.coverPdfUrl
        };

        updateStatus('Sending order request to backend...\n\nPayload:\n' + JSON.stringify(payload, null, 2), 'info');

        try {
            // Call backend endpoint
            const response = await fetch(CONFIG.createPrintJobEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(payload)
            });

            // Parse response
            let responseData;
            const contentType = response.headers.get('content-type');
            if (contentType && contentType.includes('application/json')) {
                responseData = await response.json();
            } else {
                responseData = await response.text();
            }

            // Display result
            if (response.ok) {
                updateStatus(
                    'Order submitted successfully!\n\nResponse:\n' + JSON.stringify(responseData, null, 2),
                    'success'
                );
                // Reset form after successful order
                orderForm.reset();
                paymentSucceeded = false;
                paymentIntentClientSecret = null;
                processPaymentBtn.disabled = true;
                orderForm.classList.remove('payment-loading');
                calculateTotal();
            } else {
                updateStatus(
                    `Error: Order submission failed (${response.status} ${response.statusText})\n\nResponse:\n` + 
                    (typeof responseData === 'string' ? responseData : JSON.stringify(responseData, null, 2)),
                    'error'
                );
                processPaymentBtn.disabled = false;
                processPaymentBtn.textContent = 'Pay and Place Order';
                orderForm.classList.remove('payment-loading');
            }
        } catch (error) {
            updateStatus(
                'Error: Failed to submit order\n\n' + error.message + '\n\n' + error.stack,
                'error'
            );
            processPaymentBtn.disabled = false;
            processPaymentBtn.textContent = 'Pay and Place Order';
            orderForm.classList.remove('payment-loading');
        }
    }

    // Payment button handler
    processPaymentBtn.addEventListener('click', async function(e) {
        e.preventDefault();

        // Validate form
        if (!orderForm.checkValidity()) {
            orderForm.reportValidity();
            return;
        }

        // Validate Stripe card element
        const { error: cardError } = await stripe.createPaymentMethod({
            type: 'card',
            card: cardElement
        });

        if (cardError) {
            cardErrorsEl.textContent = cardError.message;
            updateStatus('Error: ' + cardError.message, 'error');
            return;
        }

        // Process payment
        await processPayment();
    });

    // Form field change listeners for total calculation
    document.getElementById('format').addEventListener('change', calculateTotal);
    document.getElementById('qty').addEventListener('input', calculateTotal);
    document.getElementById('shipping_level').addEventListener('change', calculateTotal);

    // Form validation listener
    orderForm.addEventListener('input', function() {
        if (orderForm.checkValidity() && currentOrderTotal > 0) {
            processPaymentBtn.disabled = false;
        } else {
            processPaymentBtn.disabled = true;
        }
    });

    // Update status display
    function updateStatus(message, type) {
        statusEl.textContent = message;
        statusEl.className = 'status-console ' + (type || 'info');
        statusEl.scrollTop = statusEl.scrollHeight;
    }

    // Initialize on page load
    document.addEventListener('DOMContentLoaded', function() {
        // Verify HTTPS before initializing
        if (window.location.protocol === 'https:' || window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
            initializeStripe();
            calculateTotal();
            updateStatus('Ready to process order. Complete the form and payment details to place your order.', 'info');
        } else {
            updateStatus('Error: This page requires a secure HTTPS connection. Redirecting...', 'error');
            // Redirect will happen via the script at the top of the page
        }
    });
</script>

