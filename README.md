# 🏛️ CivicConnect - Municipal Complaint Management System

A modern, full-stack web application for managing municipal complaints built with .NET 8, Entity Framework Core, and clean architecture principles.

[![.NET](https://img.shields.io/badge/.NET-8.0-blue.svg)](https://dotnet.microsoft.com/download/dotnet/8.0)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🚀 **Run Online Instantly** (No Setup Required)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/yourusername/CivicConnect)
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/yourusername/CivicConnect)
[![Run on Replit](https://replit.com/badge/github/yourusername/CivicConnect)](https://replit.com/new/github/yourusername/CivicConnect)

## 🚀 Quick Start

### Prerequisites
- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- Any code editor (VS Code, Visual Studio, etc.)

### 💻 **Run Locally (Windows)**
```batch
# 1. Clone the repository
git clone <your-repository-url>
cd CivicConnect

# 2. Run the website (double-click or command line)
run-website.bat
```

### 🐧 **Run Locally (Linux/Mac)**
```bash
# 1. Clone the repository
git clone <your-repository-url>
cd CivicConnect

# 2. Make script executable and run
chmod +x run-online.sh
./run-online.sh
```

### 📝 **Manual Setup**
```bash
# 1. Clone and navigate
git clone <your-repository-url>
cd CivicConnect

# 2. Restore dependencies
dotnet restore

# 3. Run the website
cd src/CivicConnect.Web
dotnet run

# 4. Optional: Run API only
cd src/CivicConnect.API
dotnet run
```

### 🌐 **Access the Application**
- **Website**: https://localhost:5001 (Complete UI)
- **API Documentation**: https://localhost:5001/swagger
- **HTTP Alternative**: http://localhost:5000

## 🎯 Features

### 👥 User Roles
- **Citizens** - Submit and track complaints
- **Officials** - Manage assigned complaints  
- **Admins** - System oversight and complaint assignment

### 🔄 Complaint Lifecycle
```
Open → In Progress → Resolved → Verified
   ↙                    ↗
Reopened ←→ In Progress
```

### ✨ Core Functionality
- 🎫 **Unique Tracking Numbers** - Format: CC{YYMMDD}{NNNN}
- 🏷️ **Auto-Assignment** - Smart routing based on category
- 📧 **Email Notifications** - Status updates and assignments
- 💬 **Comment System** - Bi-directional communication
- 🔄 **Reopen Mechanism** - Citizens can reopen resolved complaints
- 📊 **Status Tracking** - Real-time complaint monitoring

## 🏗️ Architecture

Built with **Clean Architecture** principles:

```
├── CivicConnect.Core/       # 🎯 Domain Layer
│   ├── Entities/           # Domain models
│   ├── Enums/             # Status, Category, Priority
│   └── Interfaces/        # Service contracts
├── CivicConnect.Data/      # 💾 Data Layer  
│   ├── ApplicationDbContext # EF Core context
│   ├── Repository.cs       # Generic repository
│   └── DbInitializer.cs    # Database seeding
├── CivicConnect.API/       # 🌐 API Layer
│   ├── Controllers/        # REST endpoints
│   ├── Services/          # Business logic
│   └── Program.cs         # Startup configuration
└── CivicConnect.Web/       # 🖥️ Web Application
    ├── Pages/             # Blazor pages and components
    ├── Shared/            # Layout and navigation
    ├── Services/          # Client-side services
    └── wwwroot/           # Static files and CSS
```

## 📊 Database Schema

### Core Entities
- **ApplicationUser** - Extended Identity user with municipal info
- **Complaint** - Main entity with full tracking capabilities  
- **Department** - Municipal departments (Public Works, Parks, etc.)
- **Comment** - Communication threads with internal/public visibility
- **Attachment** - File uploads for complaints and comments

### Key Relationships
- User ↔ Complaints (One-to-Many)
- Department ↔ Complaints (One-to-Many)
- Complaint ↔ Comments (One-to-Many)
- Complaint ↔ Attachments (One-to-Many)

## 🧪 Test Data

The application auto-seeds test data on first run:

| Role | Email | Password |
|------|-------|----------|
| **Admin** | admin@civicconnect.gov | Admin@123 |
| **Official** | official.publicworks@civicconnect.gov | Official@123 |
| **Citizen** | citizen@example.com | Citizen@123 |

### Pre-Seeded Departments
- 🔧 Public Works (Roads, Water, Lighting)
- 🌱 Environmental Services (Waste Management)
- 🏞️ Parks and Recreation  
- 🚨 Public Safety (Safety, Noise)
- 🚌 Transportation
- 🏗️ Code Enforcement

## 🌐 API Endpoints

### Complaints
- `GET /api/complaints` - List all complaints
- `GET /api/complaints/{id}` - Get specific complaint
- `GET /api/complaints/tracking/{number}` - Public tracking
- `POST /api/complaints` - Create new complaint
- `PUT /api/complaints/{id}/status` - Update status
- `PUT /api/complaints/{id}/assign` - Assign to official
- `PUT /api/complaints/{id}/reopen` - Reopen complaint

### Example Request
```json
POST /api/complaints
{
  "title": "Broken Street Light",
  "description": "Street light at Main St & 1st Ave is not working",
  "category": 7,
  "priority": 2,
  "location": "Main St & 1st Ave",
  "address": "100 Main Street",
  "city": "Metro City",
  "zipCode": "12345",
  "citizenId": "user123",
  "emailNotificationsEnabled": true
}
```

## 🛠️ Technology Stack

- **Frontend**: Blazor Server (C# + HTML/CSS)
- **Backend**: ASP.NET Core 8.0 Web API
- **Database**: SQLite (production-ready, no setup required)
- **ORM**: Entity Framework Core 8.0
- **Authentication**: ASP.NET Identity with role-based access
- **UI Framework**: Bootstrap 5 with custom styling
- **Icons**: Bootstrap Icons
- **Documentation**: Swagger/OpenAPI
- **Architecture**: Clean Architecture with Repository Pattern

## 🔧 Development

### Project Structure
```
CivicConnect/
├── 📄 CivicConnect.sln         # Solution file
├── 🔧 global.json             # .NET SDK version
├── 📝 README.md               # This file  
├── 🚫 .gitignore              # Git ignore rules
└── 📁 src/                    # Source code
    ├── CivicConnect.Core/     # Domain layer
    ├── CivicConnect.Data/     # Data access
    └── CivicConnect.API/      # Web API
```

### Adding New Features
1. **Domain First** - Add entities to `CivicConnect.Core`
2. **Data Layer** - Update `ApplicationDbContext` and repositories
3. **API Layer** - Create controllers and services
4. **Migration** - Add EF Core migration if needed

### Database Operations
```bash
# Add migration (from project root)
cd src/CivicConnect.Data
dotnet ef migrations add MigrationName --startup-project ../CivicConnect.API

# Update database
dotnet ef database update --startup-project ../CivicConnect.API
```

## 📱 Usage Examples

### Submit a Complaint
```http
POST /api/complaints
Content-Type: application/json

{
  "title": "Pothole on Main Street",
  "description": "Large pothole causing traffic issues",
  "category": 2,
  "priority": 3,
  "location": "Main Street near City Hall",
  "citizenId": "citizen123"
}
```

### Track a Complaint
```http
GET /api/complaints/tracking/CC2501010001
```

### Update Status (Officials)
```http
PUT /api/complaints/123/status
Content-Type: application/json

{
  "status": 3,
  "notes": "Pothole has been filled and road resurfaced",
  "previousStatus": "In Progress"
}
```

## 🚀 Deployment

### Local Development
```bash
cd src/CivicConnect.API
dotnet run
```

### Production Build
```bash
dotnet publish src/CivicConnect.API -c Release -o ./publish
```

### Docker (Optional)
```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY ./publish .
ENTRYPOINT ["dotnet", "CivicConnect.API.dll"]
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`  
5. Open a Pull Request

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- 🐛 **Issues**: Create an issue in the repository
- 📖 **Documentation**: Check this README and code comments
- 💡 **Feature Requests**: Open an issue with the enhancement label

---

**Built with ❤️ using .NET 8.0, ASP.NET Core, and Clean Architecture principles**

### Quick Commands Summary
```bash
# Setup and run locally
git clone <repo-url> && cd CivicConnect
dotnet restore
cd src/CivicConnect.API && dotnet run

# Run online (no setup required)
# Just click the badges above or see ONLINE-DEPLOYMENT.md

# Access points
API: https://localhost:5001
Swagger: https://localhost:5001/swagger
Database: CivicConnect.db (auto-created)
```

### 🌐 Online Deployment
For detailed instructions on running this project directly from Git repositories on GitHub Codespaces, Gitpod, or Replit, see **[ONLINE-DEPLOYMENT.md](ONLINE-DEPLOYMENT.md)** 