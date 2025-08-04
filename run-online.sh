#!/bin/bash

echo "🏛️ Starting CivicConnect Municipal Complaint Management System"
echo "=================================================="

# Check if .NET is installed
if ! command -v dotnet &> /dev/null; then
    echo "❌ .NET SDK not found. Please install .NET 8.0 SDK"
    exit 1
fi

echo "✅ .NET SDK found: $(dotnet --version)"

# Restore dependencies
echo "📦 Restoring NuGet packages..."
dotnet restore

if [ $? -ne 0 ]; then
    echo "❌ Failed to restore packages"
    exit 1
fi

echo "✅ Packages restored successfully"

# Navigate to API project
cd src/CivicConnect.API

# Update database (create if not exists)
echo "🗄️ Updating database..."
dotnet ef database update 2>/dev/null || echo "ℹ️ Database will be created on first run"

# Start the API
echo "🚀 Starting CivicConnect API..."
echo "=================================================="
echo "🌐 API will be available at:"
echo "   • HTTP:  http://localhost:5000"
echo "   • HTTPS: https://localhost:5001"
echo "   • Swagger: https://localhost:5001/swagger"
echo "=================================================="
echo "📧 Test Accounts:"
echo "   • Admin:    admin@civicconnect.gov / Admin@123"
echo "   • Official: official.publicworks@civicconnect.gov / Official@123"
echo "   • Citizen:  citizen@example.com / Citizen@123"
echo "=================================================="

# Run with URLs for online environments
dotnet run --urls="http://0.0.0.0:5000;https://0.0.0.0:5001" 