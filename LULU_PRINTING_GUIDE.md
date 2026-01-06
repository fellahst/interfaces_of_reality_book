# Lulu.com Printing Guide

This document outlines the changes made to prepare your book for printing on Lulu.com and additional steps you need to complete.

## Changes Made

### 1. Page Size and Layout
- **Page Size**: Changed to 6" × 9" (standard trade book size)
- **Document Class**: Changed from `openany` to `openright` (chapters start on odd/right-hand pages)

### 2. Margins (Lulu.com Compliant)
- **Inner margin**: 0.75" (includes 0.25" gutter for binding)
- **Outer margin**: 0.5" (minimum requirement)
- **Top margin**: 0.75"
- **Bottom margin**: 0.625"

All margins meet Lulu's minimum 0.5" requirement.

### Files Modified
- `Interfaces of Reality - Complete Book.tex` - Updated document class and geometry settings
- `generate_pdf_with_index.ps1` - Updated pandoc command with new geometry settings

## Next Steps Before Uploading to Lulu.com

### 1. Generate a New PDF
Run your build script to generate a new PDF with the updated dimensions:
```powershell
.\generate_pdf_with_index.ps1
```

### 2. Verify Your PDF Meets Requirements
- [ ] Page size is exactly 6" × 9"
- [ ] All margins are at least 0.5"
- [ ] Odd pages are on the right (recto), even pages on the left (verso)
- [ ] No content extends beyond the safe margins
- [ ] Page numbers are sequential and correct

### 3. Check Image Resolution
All images in your book should be at least **300 DPI (pixels per inch)** for print quality. To check image resolution:
- Use an image editor (GIMP, Photoshop, etc.)
- Check the DPI/PPI setting for each image
- If images are below 300 DPI, you'll need to replace them with higher-resolution versions

### 4. Font Embedding
Fonts should be automatically embedded when using pdflatex, but verify:
- Open your PDF in Adobe Acrobat Reader
- Go to File → Properties → Fonts
- Ensure all fonts show as "Embedded" or "Embedded Subset"

### 5. Cover File (Separate from Interior)
Lulu.com requires a **separate cover PDF** file. Important points:

- **Cover Template**: Use Lulu's cover template generator (available when you create a book project on their website)
  - The template provides exact dimensions based on your page count and paper type
  - Includes spine width calculation
  - Includes bleed areas and safety margins

- **Cover Dimensions**:
  - Single PDF with: Back Cover + Spine + Front Cover (continuous image)
  - Includes 0.125" bleed on all edges
  - Keep critical text/images at least 0.5" away from trim edges

- **Current Interior PDF**: Your current PDF includes a front cover image. For Lulu printing:
  - You may want to remove the front cover page from the interior PDF (Lulu handles covers separately)
  - OR keep it if you prefer, but ensure your cover template matches

### 6. Content Adjustments (Optional)
Consider these adjustments:

- **Front Cover in Interior**: If you want to remove the front cover image from the interior PDF since Lulu handles covers separately, you can comment out the front cover image in `chapter_format.tex` (lines 139-148).

- **Back Cover**: Your interior PDF includes a back cover with text overlay. For Lulu, this should be part of your separate cover PDF, not the interior. You may want to remove it from the interior PDF (see `chapter_format.tex` around line 15082).

### 7. Order a Proof Copy
Before finalizing:
- Upload your files to Lulu.com
- Order a proof copy to review the physical book
- Check margins, image quality, binding, and overall appearance
- Make any necessary adjustments before approving for distribution

## Lulu.com Upload Checklist

- [ ] Interior PDF: 6" × 9" page size, proper margins
- [ ] Cover PDF: Created using Lulu's template generator
- [ ] All images are 300 DPI or higher
- [ ] All fonts are embedded
- [ ] Page layout: odd pages on right, even on left
- [ ] Sequential page numbering
- [ ] Proof copy ordered and reviewed

## Additional Resources

- [Lulu Book Creation Guide](https://assets.lulu.com/media/guides/en/lulu-book-creation-guide.pdf)
- [Lulu Formatting Tips](https://help.lulu.com/en/support/solutions/articles/64000255583-tips-for-formatting-documents)
- [Lulu Cover Creation](https://help.lulu.com/en/support/solutions/articles/64000255486-how-to-create-a-print-book)

## Notes

- **Book Size**: We've configured for 6" × 9". If you prefer a different size (e.g., 5.5" × 8.5" or 7" × 10"), you'll need to update the geometry settings accordingly.

- **Bleed**: We've configured for no bleed (standard margins). If your design includes images that extend to the page edges, you'll need to add 0.125" bleed margins (making the PDF 6.25" × 9.25" with content area 6" × 9").

- **ISBN**: If using your own ISBN, ensure the barcode is placed in the designated area on the back cover according to Lulu's template.


