# Rebuild Tours and Travels Solution
Write-Host "🔨 Rebuilding Tours and Travels Project..." -ForegroundColor Cyan

# Find MSBuild
$msbuildPaths = @(
    "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Current\Bin\MSBuild.exe"
)

$msbuild = $null
foreach ($path in $msbuildPaths) {
    if (Test-Path $path) {
        $msbuild = $path
        Write-Host "✅ Found MSBuild at: $path" -ForegroundColor Green
        break
    }
}

if (-not $msbuild) {
    Write-Host "❌ MSBuild not found. Please build using Visual Studio:" -ForegroundColor Red
    Write-Host "   1. Open solution in Visual Studio" -ForegroundColor Yellow
    Write-Host "   2. Press Ctrl+Shift+B (Build Solution)" -ForegroundColor Yellow
    Write-Host "   3. Check Output window for errors" -ForegroundColor Yellow
    exit 1
}

# Navigate to solution directory
Set-Location "D:\Exploria"

# Restore NuGet packages
Write-Host "`n📦 Restoring NuGet packages..." -ForegroundColor Cyan
$solutionFile = "Tours&Travels.sln"
& $msbuild $solutionFile /t:Restore /v:minimal

# Build solution
Write-Host "`n🔨 Building solution..." -ForegroundColor Cyan
& $msbuild $solutionFile /t:Build /p:Configuration=Debug /v:minimal /p:DeployOnBuild=false

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ BUILD SUCCESSFUL!" -ForegroundColor Green
    
    # Check if DLL was created
    $dllPath = "Tours&Travels\bin\Tours&Travels.dll"
    if (Test-Path $dllPath) {
        Write-Host "✅ DLL created successfully" -ForegroundColor Green
        
        # Check report file
        $reportPath = "Tours&Travels\bin\Reports\BookingSummaryReport.rpt"
        if (Test-Path $reportPath) {
            Write-Host "✅ BookingSummaryReport.rpt copied to bin folder" -ForegroundColor Green
        } else {
            Write-Host "⚠️  BookingSummaryReport.rpt not in bin folder" -ForegroundColor Yellow
        }
        
        Write-Host "`n🚀 You can now press F5 in Visual Studio to run!" -ForegroundColor Green
    } else {
        Write-Host "❌ DLL NOT created" -ForegroundColor Red
    }
} else {
    Write-Host "`n❌ BUILD FAILED!" -ForegroundColor Red
    Write-Host "Please check the error messages above" -ForegroundColor Yellow
    exit 1
}
