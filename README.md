# Interfaces of Reality - Jekyll Site

This is a Jekyll-based website for "Interfaces of Reality" by Stephane Fellah, designed to be deployed on GitHub Pages.

## Features

- ✅ Responsive navigation bar on all pages
- ✅ Uniform theme and styling across all pages
- ✅ Mobile-friendly design
- ✅ All 9 interface layers documented
- ✅ About the Author page
- ✅ Custom 404 page
- ✅ Ready for GitHub Pages deployment

## Quick Start

### Prerequisites

- Ruby (2.7 or higher recommended)
- Bundler gem

### Setup

1. Install Ruby and Bundler (if not already installed)
2. Install dependencies:
   ```bash
   bundle install
   ```

### Local Development

Run Jekyll locally from the docs directory:
```bash
cd docs
bundle exec jekyll serve
```

Or from the root directory:
```bash
bundle exec jekyll serve --source docs
```

The site will be available at `http://localhost:4000`

To rebuild and see changes:
```bash
bundle exec jekyll serve --livereload
```

## Deployment to GitHub Pages

See `DEPLOYMENT.md` for detailed deployment instructions.

Quick steps:
1. Update `docs/_config.yml` with your GitHub Pages URL
2. Push this repository to GitHub
3. Go to Settings > Pages in your GitHub repository
4. Select the branch (usually `main`) and folder (`/docs` - important!)
5. GitHub Pages will automatically build and deploy your site

## Project Structure

```
.
├── docs/                # Jekyll site (served by GitHub Pages)
│   ├── _config.yml      # Jekyll configuration and navigation
│   ├── _layouts/
│   │   └── default.html # Main page layout with navigation
│   ├── _includes/
│   │   └── navigation.html # Navigation menu component
│   ├── assets/
│   │   ├── css/
│   │   │   └── main.css # Main stylesheet
│   │   └── *.jpg        # Images and assets
│   ├── index.md         # Home page
│   ├── about-author.md  # About the author page
│   ├── layer-*.md       # Layer pages (01-09)
│   └── 404.md          # Custom 404 page
├── Gemfile             # Jekyll dependencies
├── README.md           # This file
└── DEPLOYMENT.md       # Detailed deployment guide
```

## Navigation

The navigation menu is defined in `docs/_config.yml` under the `navigation` key and rendered by `docs/_includes/navigation.html`. All pages use the `default` layout which automatically includes the navigation bar.

To add a new page:
1. Create a `.md` file in the `docs/` directory with front matter
2. Add it to the `navigation` array in `docs/_config.yml`
3. The page will automatically appear in the navigation

## Customization

### Changing Colors

Edit `assets/css/main.css` and modify the CSS variables:
```css
:root {
    --primary-color: #667eea;
    --secondary-color: #764ba2;
    /* ... */
}
```

### Adding Pages

1. Create a new `.md` file in the root directory
2. Add front matter:
   ```yaml
   ---
   layout: default
   title: Your Page Title
   ---
   ```
3. Add to navigation in `_config.yml`

## Troubleshooting

### Images not showing
- Ensure image paths use `{{ '/assets/image.jpg' | relative_url }}`
- Check that images exist in the `assets/` directory

### Navigation not working
- Verify URLs in `_config.yml` match page permalinks
- Check that all `.md` files have proper front matter

### Build errors
- Run `bundle update` to update dependencies
- Check Jekyll version compatibility

## License

This website is part of the "Interfaces of Reality" book project by Stephane Fellah.

## Support

For deployment help, see `DEPLOYMENT.md`. For Jekyll documentation, visit [jekyllrb.com](https://jekyllrb.com/docs/).
