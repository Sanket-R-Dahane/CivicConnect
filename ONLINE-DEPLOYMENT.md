# 🌐 Running CivicConnect Online - Complete Guide

This guide shows you how to run CivicConnect directly from a Git repository on various online platforms without any local setup.

## 🚀 Quick Start Options

### **Option 1: GitHub Codespaces (Recommended)**

**One-Click Deploy:**
```
https://codespaces.new/yourusername/CivicConnect
```

**Steps:**
1. Go to your GitHub repository
2. Click green **"Code"** button
3. Select **"Codespaces"** tab  
4. Click **"Create codespace on main"**
5. **Automatic setup** - project runs automatically!

**Access Points:**
- **API**: Forwarded port will be shown in terminal
- **Swagger**: `{forwarded-url}/swagger`

---

### **Option 2: Gitpod**

**One-Click Deploy:**
```
https://gitpod.io/#https://github.com/yourusername/CivicConnect
```

**Automatic Features:**
- ✅ Auto-installs .NET 8.0 SDK
- ✅ Auto-restores NuGet packages  
- ✅ Auto-starts API server
- ✅ Auto-opens browser to API

**Manual Start (if needed):**
```bash
./run-online.sh
```

---

### **Option 3: Replit**

**Steps:**
1. Go to [replit.com](https://replit.com)
2. Click **"Create Repl"**
3. Select **"Import from GitHub"**
4. Enter: `https://github.com/yourusername/CivicConnect`
5. **Auto-runs** on import!

**Alternative - Fork existing:**
```
https://replit.com/@username/CivicConnect
```

---

## 🔧 Configuration Files Included

Your project now includes these auto-configuration files:

### **GitHub Codespaces**
- `.devcontainer/devcontainer.json` - VS Code setup, extensions, port forwarding
- Auto-installs C# extensions
- Pre-configured debugging
- Automatic port forwarding (5000, 5001)

### **Gitpod**  
- `.gitpod.yml` - Workspace configuration
- Pre-builds enabled for faster startup
- Auto-starts tasks
- Browser auto-opens to API

### **Replit**
- `.replit` - Run configuration
- `replit.nix` - Environment dependencies
- Automatic .NET 8.0 setup

### **Universal Script**
- `run-online.sh` - Works on all Linux-based platforms
- Handles dependency restoration
- Database initialization
- Pretty startup messages

---

## 🎯 Testing the API

Once running on any platform:

### **1. Access Swagger UI**
```
{your-environment-url}/swagger
```

### **2. Test Endpoints**
```bash
# Get all complaints
GET /api/complaints

# Create a complaint
POST /api/complaints
{
  "title": "Test Complaint",
  "description": "Testing from online environment",
  "category": 2,
  "priority": 1,
  "location": "Online",
  "citizenId": "test-user"
}

# Track complaint
GET /api/complaints/tracking/{trackingNumber}
```

### **3. Use Test Accounts**
| Role | Email | Password |
|------|-------|----------|
| **Admin** | admin@civicconnect.gov | Admin@123 |
| **Official** | official.publicworks@civicconnect.gov | Official@123 |
| **Citizen** | citizen@example.com | Citizen@123 |

---

## 🐛 Troubleshooting

### **Issue: Port Not Accessible**
**Solution:**
```bash
# Ensure correct URLs for online environments
dotnet run --urls="http://0.0.0.0:5000"
```

### **Issue: Database Not Created**
**Solution:**
```bash
cd src/CivicConnect.API
dotnet ef database update
```

### **Issue: Dependencies Not Restored**
**Solution:**
```bash
dotnet restore
dotnet clean
dotnet build
```

### **Issue: Codespaces Not Starting**
1. Check `.devcontainer/devcontainer.json` exists
2. Rebuild container: **Cmd/Ctrl + Shift + P** → "Rebuild Container"

---

## 🌟 Platform-Specific Features

### **GitHub Codespaces**
- **Pros**: Full VS Code experience, best for development
- **Performance**: Excellent (2-4 cores, 4-8GB RAM)
- **Cost**: 60 hours/month free, then $0.18/hour
- **Best For**: Development, debugging, full features

### **Gitpod**  
- **Pros**: Fast startup, great for demos
- **Performance**: Good (shared resources)
- **Cost**: 50 hours/month free
- **Best For**: Quick testing, demos, reviews

### **Replit**
- **Pros**: Simple, educational-friendly
- **Performance**: Basic (shared resources)  
- **Cost**: Free tier available
- **Best For**: Learning, simple testing, education

---

## 🚀 Advanced Online Setup

### **Custom Environment Variables**
Create `.env` file in online environments:
```bash
ASPNETCORE_ENVIRONMENT=Development
ASPNETCORE_URLS=http://0.0.0.0:5000
ConnectionStrings__DefaultConnection=Data Source=CivicConnect.db
```

### **Database Persistence**
Online environments automatically persist SQLite database between sessions.

### **Logs and Monitoring**
```bash
# View real-time logs
dotnet run --verbosity normal

# Check database
ls -la *.db
```

---

## 📱 Mobile Access

All online platforms provide mobile-friendly URLs:
- **Responsive Swagger UI**
- **Mobile API testing**
- **Touch-friendly debugging**

---

## 🎉 One-Click Badges for Repository

Add these to your GitHub README:

```markdown
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/yourusername/CivicConnect)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/yourusername/CivicConnect)

[![Run on Replit](https://replit.com/badge/github/yourusername/CivicConnect)](https://replit.com/new/github/yourusername/CivicConnect)
```

---

## 🔗 Quick Links Summary

| Platform | One-Click URL |
|----------|---------------|
| **Codespaces** | `https://codespaces.new/yourusername/CivicConnect` |
| **Gitpod** | `https://gitpod.io/#https://github.com/yourusername/CivicConnect` |
| **Replit** | `https://replit.com/new/github/yourusername/CivicConnect` |

**🎯 Result**: Professional municipal complaint management system running in under 2 minutes, zero local setup required! 