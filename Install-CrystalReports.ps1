# Crystal Reports Installation Script
# Run this in Package Manager Console in Visual Studio

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Crystal Reports Installation for Exploria" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 1: Installing Crystal Reports Engine..." -ForegroundColor Yellow
Install-Package CrystalReports.Engine -Version 13.0.4000 -ProjectName "Tours&Travels"

Write-Host ""
Write-Host "Step 2: Installing Crystal Reports Shared..." -ForegroundColor Yellow
Install-Package CrystalReports.Shared -Version 13.0.4000 -ProjectName "Tours&Travels"

Write-Host ""
Write-Host "Step 3: Installing Crystal Reports ClientDoc..." -ForegroundColor Yellow
Install-Package CrystalReports.ReportAppServer.ClientDoc -Version 13.0.4000 -ProjectName "Tours&Travels"

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "✅ Crystal Reports Installation Complete!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Rebuild your solution (Ctrl+Shift+B)" -ForegroundColor White
Write-Host "2. Configure Web.config (see CRYSTAL_REPORTS_GUIDE.md)" -ForegroundColor White
Write-Host "3. Test the invoice generation on bookingConfirmation.aspx" -ForegroundColor White
Write-Host ""
Write-Host "Documentation: See CRYSTAL_REPORTS_GUIDE.md for full setup" -ForegroundColor Yellow
