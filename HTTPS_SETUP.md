# HTTPS Setup for GitHub Pages Custom Domain

## Problem

Stripe requires HTTPS for payment processing. If you see the error "automatic payment is disabled because it does not use a secure connection," your site is not being served over HTTPS.

## Solution: Enable HTTPS on GitHub Pages

### Step 1: Verify Custom Domain Configuration

1. Go to your GitHub repository: `https://github.com/fellahst/interfaces_of_reality_book`
2. Click **Settings** → **Pages**
3. Under **Custom domain**, verify it shows: `www.interfacesofreality.com`
4. Make sure the **Enforce HTTPS** checkbox is **checked** ✅

### Step 2: DNS Configuration at Hostinger

**Important**: You do NOT need to enable SSL/HTTPS at Hostinger. GitHub Pages automatically provides SSL certificates. You only need to configure DNS records.

#### Configure DNS in Hostinger:

1. **Log in to Hostinger** (hPanel)
2. Go to **Domains** → Select `interfacesofreality.com`
3. Click **DNS / Name Servers** or **DNS Zone Editor**

#### For www subdomain (Recommended):

Add a **CNAME record**:
- **Type**: CNAME
- **Name/Host**: `www`
- **Points to/Target**: `fellahst.github.io`
- **TTL**: 3600 (or default)

#### For apex domain (interfacesofreality.com):

Add **A records** (4 records):
- **Type**: A
- **Name/Host**: `@` (or leave blank, or `interfacesofreality.com`)
- **Points to/Target**: `185.199.108.153`
- **TTL**: 3600

- **Type**: A
- **Name/Host**: `@`
- **Points to/Target**: `185.199.109.153`
- **TTL**: 3600

- **Type**: A
- **Name/Host**: `@`
- **Points to/Target**: `185.199.110.153`
- **TTL**: 3600

- **Type**: A
- **Name/Host**: `@`
- **Points to/Target**: `185.199.111.153`
- **TTL**: 3600

#### Important Notes for Hostinger:

- **DO NOT** enable SSL/HTTPS in Hostinger's SSL settings
- **DO NOT** use Hostinger's CDN or SSL features
- **DO NOT** set up redirects in Hostinger
- GitHub Pages will handle all SSL/HTTPS automatically
- DNS changes can take 24-48 hours to propagate

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

1. Visit `https://www.interfacesofreality.com/order/` (redirects to Get the book) or `/get-the-book.html`
2. Check browser address bar shows 🔒 (lock icon)
3. Confirm the page loads over HTTPS without mixed-content warnings

## Troubleshooting

### Issue: "Enforce HTTPS" checkbox is grayed out

**Cause**: SSL certificate not yet provisioned or DNS not configured correctly.

**Solution**:
- Wait up to 24 hours for certificate provisioning
- Verify DNS records are correct using `dig` or online DNS checker (e.g., https://dnschecker.org)
- Make sure CNAME file in repository matches your domain
- **If using Hostinger**: Ensure you haven't enabled SSL/HTTPS in Hostinger's panel (it conflicts with GitHub Pages SSL)

### Issue: Hostinger SSL/HTTPS settings interfering

**Cause**: Hostinger may have SSL enabled which conflicts with GitHub Pages SSL.

**Solution**:
1. Log in to Hostinger hPanel
2. Go to **Domains** → Your domain → **SSL**
3. **Disable** any SSL/HTTPS features in Hostinger
4. GitHub Pages will handle SSL automatically
5. Wait 24-48 hours for changes to propagate

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

1. **HTTPS redirect**: Layout script redirects HTTP to HTTPS (except on localhost).
2. **Content Security Policy**: `upgrade-insecure-requests` in the default layout.

## Verification Checklist

- [ ] Custom domain configured in GitHub Pages settings
- [ ] DNS records properly configured
- [ ] SSL certificate provisioned (green checkmark)
- [ ] "Enforce HTTPS" checkbox enabled
- [ ] Site accessible via `https://www.interfacesofreality.com`
- [ ] Order page loads without HTTPS errors
- [ ] Browser shows 🔒 lock icon in address bar

## Hostinger-Specific Checklist

- [ ] DNS records configured in Hostinger (CNAME for www, A records for apex)
- [ ] SSL/HTTPS **disabled** in Hostinger (GitHub Pages handles this)
- [ ] No CDN or proxy enabled in Hostinger that might interfere
- [ ] DNS propagation complete (check with https://dnschecker.org)
- [ ] Custom domain added in GitHub Pages settings
- [ ] CNAME file exists in repository with correct domain
- [ ] Wait 24-48 hours for GitHub Pages SSL certificate provisioning
- [ ] "Enforce HTTPS" checkbox enabled in GitHub Pages settings

## Additional Resources

- [GitHub Pages Custom Domain Documentation](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
- [GitHub Pages HTTPS Documentation](https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https)
- [Stripe Security Requirements](https://stripe.com/docs/security/guide)
- [Hostinger DNS Management Guide](https://support.hostinger.com/en/articles/1583297-how-to-manage-dns-records)

