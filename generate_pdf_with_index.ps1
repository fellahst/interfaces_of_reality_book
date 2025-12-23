# Script to generate PDF with index
# This script:
# 1. Generates the PDF (creates .idx file)
# 2. Runs makeindex on the .idx file
# 3. Regenerates the PDF to include the index

$pdfName = "Interfaces of Reality - Complete Book.pdf"
$idxName = "Interfaces of Reality - Complete Book.idx"
$indName = "Interfaces of Reality - Complete Book.ind"

Write-Host "Step 1: Generating LaTeX file..."

$texName = "Interfaces of Reality - Complete Book.tex"

pandoc manuscript/about-author.md manuscript/preface.md manuscript/part-1.md manuscript/chapter-01.md manuscript/chapter-02.md manuscript/chapter-03.md manuscript/part-2.md manuscript/chapter-04.md manuscript/chapter-05.md manuscript/chapter-06.md manuscript/part-3.md manuscript/chapter-07.md manuscript/chapter-08.md manuscript/chapter-09.md manuscript/chapter-10.md manuscript/part-4.md manuscript/chapter-11.md manuscript/chapter-12.md manuscript/chapter-13.md manuscript/part-5.md manuscript/chapter-14.md manuscript/chapter-15.md manuscript/chapter-16.md manuscript/part-6.md manuscript/chapter-17.md manuscript/chapter-18.md manuscript/chapter-19.md manuscript/epilogue.md manuscript/acknowledgments.md manuscript/appendix-glossary.md manuscript/appendix-further-reading.md manuscript/appendix-notes-references.md manuscript/appendix-references.md manuscript/index.md manuscript/back-cover.md -o $texName --pdf-engine=pdflatex --toc --toc-depth=2 --number-sections -V geometry:margin=1in -V documentclass=book -V classoption=openany -V title="Interfaces of Reality" -V subtitle="How Life, Mind, and Machines Navigate a World of Possibilities" -V author="Stephane Fellah" -V date="" -H chapter_format.tex --metadata title="Interfaces of Reality" --metadata subtitle="How Life, Mind, and Machines Navigate a World of Possibilities" --metadata author="Stephane Fellah" --standalone

Write-Host "Step 2: Compiling LaTeX (first pass to create index file)..."

pdflatex -interaction=nonstopmode $texName | Out-Null

if (Test-Path $idxName) {
    Write-Host "Step 3: Running makeindex..."
    makeindex $idxName
    
    if (Test-Path $indName) {
        Write-Host "Step 4: Compiling LaTeX (second pass to include index)..."
        pdflatex -interaction=nonstopmode $texName | Out-Null
        
        # Rename the PDF if it has a different name
        $generatedPdf = $texName -replace "\.tex$", ".pdf"
        if (Test-Path $generatedPdf) {
            Move-Item -Path $generatedPdf -Destination $pdfName -Force
        }
        
        Write-Host "PDF with index generated successfully: $pdfName"
    } else {
        Write-Host "Warning: .ind file not created. Index may be empty."
    }
} else {
    Write-Host "Warning: .idx file not found. No index entries were found in the document."
    Write-Host "To add index entries, use \index{term} in your markdown files."
}

