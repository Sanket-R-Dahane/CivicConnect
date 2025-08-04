@echo off
title CivicConnect - Municipal Complaint Management System

echo.
echo 🏛️ CivicConnect - Municipal Complaint Management System
echo ==================================================
echo.

echo ✅ Checking .NET installation...
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ❌ .NET 8.0 SDK not found!
    echo.
    echo Please install .NET 8.0 SDK from:
    echo https://dotnet.microsoft.com/download/dotnet/8.0
    echo.
    pause
    exit /b 1
)

echo ✅ .NET SDK found: 
dotnet --version

echo.
echo 📦 Restoring NuGet packages...
dotnet restore
if errorlevel 1 (
    echo ❌ Failed to restore packages
    pause
    exit /b 1
)

echo ✅ Packages restored successfully
echo.

cd src\CivicConnect.Web

echo 🗄️ Updating database...
dotnet ef database update 2>nul || echo ℹ️ Database will be created on first run

echo.
echo 🚀 Starting CivicConnect Website...
echo ==================================================
echo.
echo 🌐 Website will be available at:
echo   • https://localhost:5001 (Main Website)
echo   • http://localhost:5000  (HTTP Alternative)
echo.
echo 📧 Test Accounts:
echo   • Admin:    admin@civicconnect.gov / Admin@123
echo   • Official: official.publicworks@civicconnect.gov / Official@123  
echo   • Citizen:  citizen@example.com / Citizen@123
echo.
echo 🎯 Features Available:
echo   • Submit and track complaints
echo   • Role-based dashboards
echo   • Complete complaint lifecycle
echo   • Modern responsive UI
echo.
echo ==================================================
echo Press Ctrl+C to stop the server
echo ==================================================
echo.

dotnet run --urls="http://localhost:5000;https://localhost:5001" 