---
layout: default
title: Order Printed Book
permalink: /order/
---

<div class="page-header">
    <h1>Order a printed copy</h1>
    <p style="color: #666; font-size: 1.1em; margin-top: 10px;">
        This page securely processes your order through our backend endpoint. 
        Your payment and shipping information is never exposed to the browser—all sensitive operations 
        are handled server-side.
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
</style>

<div class="order-container">
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

        <!-- Section C: Pay -->
        <div class="order-section">
            <h2>Payment</h2>
            <p style="color: #666; margin-bottom: 16px;">
                <strong>Note:</strong> This is a development version. In production, integrate with a payment provider 
                (Stripe, PayPal, etc.) before enabling real orders. The backend endpoint handles Lulu API authentication 
                securely—never expose OAuth secrets in browser JavaScript.
            </p>
            <div class="button-group">
                <button type="button" id="mockPaymentBtn" class="btn btn-secondary">
                    Mock Payment Succeeded
                </button>
                <button type="submit" id="placeOrderBtn" class="btn btn-primary" disabled>
                    Place Order
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

<script>
    // Configuration - REPLACE THESE VALUES BEFORE PRODUCTION
    // 
    // IMPORTANT SECURITY NOTES:
    // - Never call Lulu API directly from browser JavaScript
    // - Lulu requires OAuth 2.0 authentication with client_id and client_secret
    // - Client secrets must NEVER be exposed in browser code
    // - This page calls a secure backend endpoint (Cloudflare Worker/serverless function)
    // - The backend handles all Lulu API authentication and communication
    // - Before production: integrate real payment processing (Stripe, PayPal, etc.)
    // - Replace pod_package_id values with actual Lulu package IDs from your Lulu account
    const CONFIG = {
        // Your Cloudflare Worker or serverless function endpoint
        createPrintJobEndpoint: "https://YOUR-WORKER.your-subdomain.workers.dev",
        
        // Book metadata
        bookTitle: "REPLACE_WITH_YOUR_BOOK_TITLE",
        
        // PDF URLs - host these on your CDN or static hosting
        interiorPdfUrl: "https://YOUR_HOSTING/interior.pdf",
        coverPdfUrl: "https://YOUR_HOSTING/cover.pdf"
    };

    // State
    let paymentSucceeded = false;

    // DOM elements
    const orderForm = document.getElementById('orderForm');
    const mockPaymentBtn = document.getElementById('mockPaymentBtn');
    const placeOrderBtn = document.getElementById('placeOrderBtn');
    const statusEl = document.getElementById('status');

    // Mock payment handler
    mockPaymentBtn.addEventListener('click', function() {
        paymentSucceeded = true;
        placeOrderBtn.disabled = false;
        updateStatus('Payment status: Mock payment succeeded. You can now place your order.', 'success');
        mockPaymentBtn.disabled = true;
        mockPaymentBtn.textContent = 'Payment Confirmed';
    });

    // Form submission handler
    orderForm.addEventListener('submit', async function(e) {
        e.preventDefault();

        // Validate payment
        if (!paymentSucceeded) {
            updateStatus('Error: Payment must be completed before placing order.', 'error');
            return;
        }

        // Validate form
        if (!orderForm.checkValidity()) {
            orderForm.reportValidity();
            return;
        }

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

        // Show loading state
        placeOrderBtn.disabled = true;
        placeOrderBtn.textContent = 'Processing...';
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
                // Optionally reset form or redirect
                // orderForm.reset();
                // paymentSucceeded = false;
                // placeOrderBtn.disabled = true;
            } else {
                updateStatus(
                    `Error: Order submission failed (${response.status} ${response.statusText})\n\nResponse:\n` + 
                    (typeof responseData === 'string' ? responseData : JSON.stringify(responseData, null, 2)),
                    'error'
                );
            }
        } catch (error) {
            updateStatus(
                'Error: Failed to submit order\n\n' + error.message + '\n\n' + error.stack,
                'error'
            );
        } finally {
            placeOrderBtn.disabled = false;
            placeOrderBtn.textContent = 'Place Order';
        }
    });

    // Update status display
    function updateStatus(message, type) {
        statusEl.textContent = message;
        statusEl.className = 'status-console ' + (type || 'info');
        statusEl.scrollTop = statusEl.scrollHeight;
    }

    // Initial status message
    updateStatus('Ready to process order. Complete the form and click "Mock Payment Succeeded" to enable ordering.', 'info');
</script>

