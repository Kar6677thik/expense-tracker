# 💰 ExpenseTrack: DevOps-Integrated Personal Budget Tracker

A modern, responsive personal expense tracking application with full DevOps integration, featuring automated deployment via Netlify and continuous integration with GitHub Actions.

## 🚀 Features

### Core Functionality

- **Expense Management**: Add, view, and delete personal expenses
- **Category Tracking**: Organize expenses by predefined categories (Food, Transport, Entertainment, etc.)
- **Real-time Calculations**: Automatic total and category-wise expense summaries
- **Local Storage**: Persistent data storage using browser's localStorage
- **Responsive Design**: Mobile-friendly interface with modern CSS Grid and Flexbox
- **Interactive UI**: Smooth animations and hover effects for enhanced user experience

### DevOps Integration

- **GitHub Actions CI/CD**: Automated validation and testing pipeline
- **Netlify Deployment**: Automatic deployment from GitHub repository
- **Code Quality Checks**: HTML validation and JavaScript syntax checking
- **Environment Variables**: Secure handling of API keys and configuration
- **Lighthouse CI**: Performance and accessibility testing (optional)

## 🛠️ Technology Stack

- **Frontend**: HTML5, CSS3 (with modern features), Vanilla JavaScript (ES2021+)
- **Storage**: localStorage (with fallback handling)
- **DevOps**: GitHub Actions, Netlify, HTMLHint, ESLint
- **Design**: CSS Grid, Flexbox, CSS Animations, Responsive Design

## 📁 Project Structure

```
expense-tracker/
├── index.html              # Main application file
├── .github/
│   └── workflows/
│       └── validate.yml     # GitHub Actions workflow
├── .gitignore              # Git ignore rules
├── .htmlhintrc             # HTMLHint configuration
├── README.md               # This file
├── netlify.toml            # Netlify configuration (optional)
└── package.json            # npm configuration (auto-generated)
```

## 🚀 Quick Start

### Local Development

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/expense-tracker.git
   cd expense-tracker
   ```

2. **Open locally**:

   ```bash
   # Simple HTTP server
   python -m http.server 8000
   # OR
   npx serve .
   # OR just open index.html in your browser
   ```

3. **View the application**:
   Open `http://localhost:8000` in your browser

## 🔧 GitHub Setup & Deployment

### 1. GitHub Repository Setup

1. **Create a new repository** on GitHub
2. **Push your code**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: ExpenseTrack app with DevOps integration"
   git branch -M main
   git remote add origin https://github.com/yourusername/expense-tracker.git
   git push -u origin main
   ```

### 2. Netlify Deployment Setup

#### Option A: Netlify Dashboard (Recommended)

1. **Log in to [Netlify](https://netlify.com)**
2. **Click "New site from Git"**
3. **Connect your GitHub account** and select the repository
4. **Configure build settings**:
   - Build command: (leave empty for static site)
   - Publish directory: (leave empty, uses root)
5. **Deploy site**

#### Option B: Netlify CLI

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login and deploy
netlify login
netlify init
netlify deploy --prod
```

### 3. Environment Variables Setup

#### In Netlify Dashboard:

1. Go to **Site settings > Environment variables**
2. Add environment variables:
   ```
   EXPENSE_API_URL=https://your-api-endpoint.com/api
   NODE_ENV=production
   ```

#### Using Netlify CLI:

```bash
netlify env:set EXPENSE_API_URL "https://your-api-endpoint.com/api"
netlify env:set NODE_ENV "production"
```

### 4. GitHub Actions Configuration

The workflow automatically runs
