# Script to generate Lulu cover PDF
# Make sure to update lulu_cover_template.tex with dimensions from Lulu first!

$coverTex = "lulu_cover_template.tex"
$coverPdf = "lulu_cover_template.pdf"
$finalPdf = "Interfaces of Reality - Lulu Cover.pdf"

Write-Host "Generating Lulu cover PDF..." -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Make sure you have updated the dimensions in $coverTex" -ForegroundColor Yellow
Write-Host "with the exact values from Lulu's cover template!" -ForegroundColor Yellow
Write-Host ""

# Try XeLaTeX first (better font handling)
if (Get-Command xelatex -ErrorAction SilentlyContinue) {
    Write-Host "Using XeLaTeX to compile cover..." -ForegroundColor Cyan
    xelatex -interaction=nonstopmode $coverTex
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Cover PDF generated successfully!" -ForegroundColor Green
        
        # Rename to final name
        if (Test-Path $coverPdf) {
            Move-Item -Path $coverPdf -Destination $finalPdf -Force
            Write-Host "Cover saved as: $finalPdf" -ForegroundColor Green
        }
    } else {
        Write-Host "XeLaTeX compilation failed. Trying pdflatex..." -ForegroundColor Yellow
        
        # Try pdflatex as fallback
        if (Get-Command pdflatex -ErrorAction SilentlyContinue) {
            Write-Host "Using pdflatex to compile cover..." -ForegroundColor Cyan
            pdflatex -interaction=nonstopmode $coverTex
            
            if ($LASTEXITCODE -eq 0 -and (Test-Path $coverPdf)) {
                Move-Item -Path $coverPdf -Destination $finalPdf -Force
                Write-Host "Cover saved as: $finalPdf" -ForegroundColor Green
            } else {
                Write-Host "Compilation failed. Please check for errors." -ForegroundColor Red
            }
        } else {
            Write-Host "pdflatex not found. Please install a LaTeX distribution." -ForegroundColor Red
        }
    }
} elseif (Get-Command pdflatex -ErrorAction SilentlyContinue) {
    Write-Host "Using pdflatex to compile cover..." -ForegroundColor Cyan
    Write-Host "Note: You may need to comment out fontspec and use fontenc instead." -ForegroundColor Yellow
    pdflatex -interaction=nonstopmode $coverTex
    
    if ($LASTEXITCODE -eq 0 -and (Test-Path $coverPdf)) {
        Move-Item -Path $coverPdf -Destination $finalPdf -Force
        Write-Host "Cover saved as: $finalPdf" -ForegroundColor Green
    } else {
        Write-Host "Compilation failed. Please check for errors." -ForegroundColor Red
    }
} else {
    Write-Host "Error: No LaTeX compiler found (xelatex or pdflatex)." -ForegroundColor Red
    Write-Host "Please install a LaTeX distribution like MiKTeX or TeX Live." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Verify the cover PDF dimensions match Lulu's template" -ForegroundColor White
Write-Host "2. Check that all images are 300+ DPI" -ForegroundColor White
Write-Host "3. Upload to Lulu.com and order a proof copy" -ForegroundColor White


