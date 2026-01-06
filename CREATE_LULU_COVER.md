# Creating a Cover PDF for Lulu.com

This guide walks you through creating a cover PDF for your book on Lulu.com.

## Step 1: Get Cover Dimensions from Lulu

**You must get the exact dimensions from Lulu's website** because they depend on:
- Your book's page count
- Paper type (standard, premium, etc.)
- Binding type

### Process:

1. **Go to Lulu.com** and sign in to your account
2. **Create a new book project** or open an existing one
3. **Upload your interior PDF** (`Interfaces of Reality - Complete Book.pdf`)
4. **Select your book specifications**:
   - Book size: 6" × 9" (Trade Book)
   - Paper type: Standard or Premium (your choice)
   - Binding: Perfect Bound (standard)
5. **Download the Cover Template**:
   - Lulu will provide a cover template PDF
   - This template shows the exact dimensions including:
     - Back cover width (with bleed)
     - Spine width (based on your page count)
     - Front cover width (with bleed)
     - Cover height (with bleed)

## Step 2: Cover Template Configuration

The template has been **pre-configured with your exact Lulu dimensions**:

✅ **Dimensions configured:**
- **Total size**: 14.875" × 10.75"
- **Spine width**: 1.125"
- **Back cover**: 6.875" wide
- **Front cover**: 6.875" wide
- **Height**: 10.75"

The template is ready to use! You can proceed directly to Step 3 (compiling), unless you need to adjust text positioning or content.

3. **Customize the content**:
   - Adjust text positioning on back cover
   - Modify spine text if needed
   - Add or remove front cover text overlays

## Step 3: Compile the Cover PDF

### Option A: Using XeLaTeX or LuaLaTeX (Recommended for better font handling)

```powershell
xelatex -interaction=nonstopmode lulu_cover_template.tex
```

Or if using LuaLaTeX:
```powershell
lualatex -interaction=nonstopmode lulu_cover_template.tex
```

### Option B: Using pdflatex

If your images don't require special fonts, you can use pdflatex:

1. Comment out `\usepackage{fontspec}` in the template
2. Uncomment `\usepackage[T1]{fontenc}`
3. Compile:
```powershell
pdflatex -interaction=nonstopmode lulu_cover_template.tex
```

## Step 4: Verify the Cover PDF

Before uploading, ensure:

- [ ] PDF dimensions match Lulu's requirements exactly (14.875" × 10.75")
- [ ] All images are at least 300 DPI
- [ ] No critical content is within 0.5" of trim edges
- [ ] All fonts are embedded (check in PDF properties)
- [ ] Layers are flattened (LaTeX PDFs are automatically flat)
- [ ] Text on spine is readable and properly rotated
- [ ] Front cover image displays correctly
- [ ] Back cover text is properly positioned
- [ ] Single page PDF (not multiple pages)

### Verifying Font Embedding:

1. Open the PDF in Adobe Acrobat Reader (or similar)
2. Go to **File → Properties → Fonts**
3. Check that all fonts show as "Embedded" or "Embedded Subset"
4. If any fonts show as "Not Embedded", you may need to adjust your LaTeX compiler settings

### Checking PDF Dimensions:

You can check PDF dimensions using:
- Adobe Acrobat: File → Properties → Advanced → Page Size
- Or use a PDF viewer that shows document properties

### Checking Image Resolution:

- Open your cover images in an image editor
- Check Properties/Info to verify DPI (should be ≥300)

## Step 5: Remove Guidelines (Before Final Upload)

The template includes commented-out guideline code for design reference. Before uploading:

1. Make sure all guideline drawing code is commented out (it should be by default)
2. Or verify the final PDF doesn't show any red/blue dashed lines

## Step 6: Upload to Lulu

1. Go to your Lulu book project
2. Upload the cover PDF
3. Use Lulu's preview tool to verify alignment
4. Order a proof copy to see the physical result

## Troubleshooting

### Images Not Found
- Ensure `assets/interfaces_frontcover.jpg` and `assets/interfaces_backcover.jpg` exist
- Check file paths are correct (relative to where you compile the LaTeX file)

### Text Positioning Issues
- Adjust coordinates in the TikZ `\node` commands
- Coordinates are in inches from bottom-left corner
- Test positioning by uncommenting the guideline code temporarily

### Spine Text Too Small/Large
- Adjust font sizes in the spine text nodes
- Spine width may be too narrow - consider abbreviating title if needed

### Colors Not Showing
- Ensure you're using XeLaTeX or LuaLaTeX for best color support
- Check that `xcolor` package is loaded

## Alternative: Using Lulu's Cover Creation Tool

Instead of creating a PDF manually, you can also use Lulu's built-in Cover Creation Tool:

1. In your Lulu book project, select "Create Cover"
2. Use their online tool to design your cover
3. Upload your front and back cover images
4. Add text, adjust positioning
5. Export as PDF

This approach is simpler but may offer less design flexibility than a custom LaTeX template.

## Notes

- **Spine width varies significantly** based on page count. A 400-page book might have a ~0.5" spine, while a 600-page book could have ~0.75"
- **Bleed is essential** - ensure images extend 0.125" beyond trim edges
- **Safe margins** - Keep all important text/images at least 0.5" from trim edges
- **Test with a proof copy** - Always order a physical proof before finalizing

## Your Book's Cover Dimensions

**Exact dimensions from Lulu.com:**
- **Total dimensions**: 14.875" × 10.75" (377.82mm × 273.05mm)
- **Spine width**: 1.125" (28.58mm)
- **Back cover width**: 6.875" (calculated: (14.875 - 1.125) / 2)
- **Front cover width**: 6.875"
- **Cover height**: 10.75"

**Requirements:**
- ✅ File type: PDF
- ✅ Page count: 1 page
- ✅ Fonts: Must be embedded
- ✅ Layers: Must be flattened

These dimensions are now configured in `lulu_cover_template.tex`.

