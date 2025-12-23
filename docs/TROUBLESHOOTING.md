# Troubleshooting: No Styles Applied

If styles are not showing on the deployed site, check the following:

## 1. Verify CSS File Path

The CSS should be at: `docs/assets/css/main.css`

Check that it exists in your repository.

## 2. Check Baseurl Configuration

In `docs/_config.yml`, verify:
```yaml
url: https://fellahst.github.io
baseurl: /interfaces_of_reality_book
```

## 3. Verify Layout References CSS Correctly

In `docs/_layouts/default.html`, the CSS should be referenced as:
```html
<link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
```

## 4. Check GitHub Pages Build

1. Go to your repository on GitHub
2. Click on **Actions** tab
3. Check if the build is successful
4. Look for any errors in the build logs

## 5. Clear Browser Cache

Sometimes cached versions don't show new styles. Try:
- Hard refresh: Ctrl+F5 (Windows) or Cmd+Shift+R (Mac)
- Or open in incognito/private mode

## 6. Verify Assets Are Included

Make sure `assets/` folder is NOT in the exclude list in `_config.yml`.

## 7. Check Network Tab

In browser developer tools (F12):
1. Go to Network tab
2. Reload the page
3. Look for `main.css` request
4. Check if it returns 200 (success) or 404 (not found)

If it's 404, the path is wrong. If it's 200 but styles don't apply, there might be a CSS syntax error.

## 8. Test Locally First

Before deploying, test locally:
```bash
cd docs
bundle exec jekyll serve
```

Visit http://localhost:4000/interfaces_of_reality_book and check if styles work.

## Common Issues

### Issue: CSS returns 404
**Solution:** Check that `baseurl` in `_config.yml` matches your repository name exactly.

### Issue: CSS loads but styles don't apply
**Solution:** Check browser console for CSS errors. Verify CSS file syntax is correct.

### Issue: Styles work locally but not on GitHub Pages
**Solution:** 
- Verify GitHub Pages is set to use `/docs` folder
- Check that all files are committed and pushed
- Wait a few minutes for GitHub Pages to rebuild

