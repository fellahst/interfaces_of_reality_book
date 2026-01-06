# HTTPS Setup for GitHub Pages Custom Domain

## Problem

Stripe requires HTTPS for payment processing. If you see the error "automatic payment is disabled because it does not use a secure connection," your site is not being served over HTTPS.

## Solution: Enable HTTPS on GitHub Pages

### Step 1: Verify Custom Domain Configuration

1. Go to your GitHub repository: `https://github.com/fellahst/interfaces_of_reality_book`
2. Click **Settings** → **Pages**
3. Under **Custom domain**, verify it shows: `www.interfacesofreality.com`
4. Make sure the **Enforce HTTPS** checkbox is **checked** ✅

### Step 2: DNS Configuration

Your DNS must be properly configured for HTTPS to work. Verify:

1. **A Records** (for apex domain `interfacesofreality.com`):
   ```
   185.199.108.153
   185.199.109.153
   185.199.110.153
   185.199.111.153
   ```

2. **CNAME Record** (for www subdomain):
   ```
   www.interfacesofreality.com → fellahst.github.io
   ```

### Step 3: Wait for SSL Certificate

After configuring DNS:
- GitHub Pages automatically provisions an SSL certificate (can take up to 24 hours)
- You'll see a green checkmark next to "Enforce HTTPS" when ready
- The certificate is provided by Let's Encrypt

### Step 4: Enable HTTPS Enforcement

Once the certificate is ready:
1. Go to **Settings** → **Pages**
2. Check the **Enforce HTTPS** checkbox
3. Save changes

### Step 5: Verify HTTPS Works

1. Visit `https://www.interfacesofreality.com/order/`
2. Check browser address bar shows 🔒 (lock icon)
3. Test Stripe payment form loads without errors

## Troubleshooting

### Issue: "Enforce HTTPS" checkbox is grayed out

**Cause**: SSL certificate not yet provisioned or DNS not configured correctly.

**Solution**:
- Wait up to 24 hours for certificate provisioning
- Verify DNS records are correct using `dig` or online DNS checker
- Make sure CNAME file in repository matches your domain

### Issue: Mixed content warnings

**Cause**: Some resources (images, scripts) are loaded over HTTP.

**Solution**:
- All resources should use HTTPS or relative URLs
- The layout now includes `upgrade-insecure-requests` meta tag
- Check browser console for specific HTTP resources

### Issue: Certificate not trusted

**Cause**: DNS propagation not complete or misconfigured.

**Solution**:
- Wait for DNS propagation (can take up to 48 hours)
- Verify DNS records match GitHub's requirements
- Clear browser cache and try again

### Issue: Redirect loop

**Cause**: HTTPS enforcement conflicting with redirect script.

**Solution**:
- The redirect script only runs if not already on HTTPS
- If you see a loop, check that GitHub Pages HTTPS is properly enabled
- Remove any manual redirects if GitHub Pages handles it

## Testing Locally

For local development, the HTTPS check is bypassed for `localhost` and `127.0.0.1`:

```bash
# Local development works without HTTPS
bundle exec jekyll serve
# Visit: http://localhost:4000/order/
```

## Security Features Added

1. **HTTPS Redirect**: Automatically redirects HTTP to HTTPS
2. **Stripe Security Check**: Verifies HTTPS before initializing Stripe
3. **Content Security Policy**: Upgrades insecure requests to HTTPS
4. **Error Handling**: Clear error messages if HTTPS is not available

## Verification Checklist

- [ ] Custom domain configured in GitHub Pages settings
- [ ] DNS records properly configured
- [ ] SSL certificate provisioned (green checkmark)
- [ ] "Enforce HTTPS" checkbox enabled
- [ ] Site accessible via `https://www.interfacesofreality.com`
- [ ] Order page loads without HTTPS errors
- [ ] Stripe payment form initializes correctly
- [ ] Browser shows 🔒 lock icon in address bar

## Additional Resources

- [GitHub Pages Custom Domain Documentation](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
- [GitHub Pages HTTPS Documentation](https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https)
- [Stripe Security Requirements](https://stripe.com/docs/security/guide)

