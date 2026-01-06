# Lulu Cover PDF - Quick Summary

## Your Exact Requirements ✅

- **File Type**: PDF
- **Page Count**: 1 page
- **Dimensions**: 14.875" × 10.75" (377.82mm × 273.05mm)
- **Spine Width**: 1.125" (28.58mm)
- **Fonts**: Must be embedded
- **Layers**: Must be flattened

## Template Status

✅ **Template configured with exact dimensions**
- File: `lulu_cover_template.tex`
- All dimensions set to match Lulu requirements
- Uses your existing cover images:
  - `assets/interfaces_frontcover.jpg`
  - `assets/interfaces_backcover.jpg`

## Quick Start

1. **Generate the cover PDF:**
   ```powershell
   .\generate_lulu_cover.ps1
   ```

2. **Verify the output:**
   - Check PDF dimensions are 14.875" × 10.75"
   - Verify fonts are embedded (File → Properties → Fonts)
   - Review text positioning and images

3. **Upload to Lulu:**
   - Upload `Interfaces of Reality - Lulu Cover.pdf` to your Lulu project
   - Use Lulu's preview tool to verify alignment
   - Order a proof copy

## Cover Layout

```
┌─────────────────────────────────────────────────────────────┐
│                     14.875" Total Width                      │
├───────────────────┬─────────┬───────────────────────────────┤
│                   │         │                               │
│   Back Cover      │  Spine  │      Front Cover             │
│   6.875" wide     │ 1.125"  │      6.875" wide             │
│                   │         │                               │
│   [Back cover     │ [Title] │  [Front cover                │
│    text &         │ rotated │   image]                     │
│    author info]   │ 90°     │                               │
│                   │         │                               │
│                   │         │                               │
└───────────────────┴─────────┴───────────────────────────────┘
                   10.75" Height
```

## Notes

- **Safe margins**: Keep all important text/images at least 0.5" away from trim edges
- **Font embedding**: Automatically handled by LaTeX compilers (XeLaTeX/LuaLaTeX recommended)
- **Layers**: LaTeX PDFs are automatically flat (no layers)
- **Images**: Ensure your cover images are 300+ DPI for print quality

## Troubleshooting

If the compilation fails:
- Make sure you have XeLaTeX or LuaLaTeX installed (MiKTeX or TeX Live)
- Check that cover image files exist in the `assets/` folder
- Try using pdflatex if XeLaTeX isn't available (may need to modify fontspec)

For detailed instructions, see `CREATE_LULU_COVER.md`.


