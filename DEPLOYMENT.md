# Deployment Guide for GitHub Pages

This guide will help you deploy the "Interfaces of Reality" Jekyll site to GitHub Pages.

## Prerequisites

1. A GitHub account
2. Ruby and Bundler installed on your local machine (for testing)

## Step 1: Create a GitHub Repository

1. Go to GitHub and create a new repository
2. Name it (e.g., `interfaces-of-reality` or use your username for a user site)
3. Choose whether it's public or private (GitHub Pages works with both for user sites, public only for project sites)

## Step 2: Update Configuration

Edit `docs/_config.yml` and update these settings:

```yaml
# For GitHub Pages with /docs folder:
url: https://yourusername.github.io
baseurl: ""  # Keep empty for /docs folder setup
```

## Step 3: Push to GitHub

```bash
git init
git add .
git commit -m "Initial Jekyll site setup"
git branch -M main
git remote add origin https://github.com/yourusername/your-repo-name.git
git push -u origin main
```

## Step 4: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings**
3. Scroll down to **Pages** in the left sidebar
4. Under **Source**, select:
   - **Branch**: `main` (or `gh-pages` if you prefer)
   - **Folder**: `/docs` (important: select the docs folder, not root)
5. Click **Save**

## Step 5: Wait for Deployment

GitHub Pages will automatically build your site. This usually takes 1-2 minutes. You'll see a green checkmark when it's done.

## Step 6: Access Your Site

- **User/Organization site**: `https://yourusername.github.io`
- **Project site**: `https://yourusername.github.io/repository-name`

## Local Testing

Before deploying, test locally:

```bash
# Install dependencies (Gemfile can be at root or in docs/)
bundle install

# Run Jekyll server from docs directory
cd docs
bundle exec jekyll serve

# OR from root directory:
bundle exec jekyll serve --source docs

# Visit http://localhost:4000
```

## Troubleshooting

### Site not updating?
- Check the Actions tab in GitHub for build errors
- Make sure `docs/_config.yml` has correct `url` and `baseurl`
- Verify GitHub Pages is set to use `/docs` folder, not root
- Clear browser cache

### Images not showing?
- Ensure image paths use `{{ '/assets/image.jpg' | relative_url }}`
- Check that images exist in the `assets/` directory

### Navigation not working?
- Verify all URLs in `_config.yml` navigation match your page permalinks
- Check that all `.md` files have proper front matter

## Custom Domain (Optional)

To use a custom domain:

1. Add a `CNAME` file to the root with your domain name
2. Update DNS settings with your domain provider
3. Update `url` in `_config.yml` to your custom domain

## Need Help?

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- Check the `README.md` for more information

