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

The workflow automatically runs on:

- **Push to main/develop branches**
- **Pull requests to main branch**

#### Required GitHub Secrets (Optional):

For Lighthouse CI integration, add in GitHub repository settings:

```
LHCI_GITHUB_APP_TOKEN=your_lighthouse_token
```

#### Manual Workflow Trigger:

```bash
# Trigger workflow manually
gh workflow run validate.yml
```

## 🔒 Security & Environment Variables

### Environment Variables Handling

The application supports environment variables for API integration:

#### Development (.env.local):

```env
EXPENSE_API_URL=http://localhost:3001/api
NODE_ENV=development
```

#### Production (Netlify):

Set via Netlify dashboard or CLI:

```bash
netlify env:set EXPENSE_API_URL "https://api.yourservice.com"
netlify env:set NODE_ENV "production"
```

### Security Best Practices

1. **Never commit API keys** to version control
2. **Use environment variables** for all sensitive configuration
3. **Enable HTTPS** in production (automatic with Netlify)
4. **Validate user inputs** on both client and server
5. **Use CSP headers** for additional security

## 🧪 Testing & Validation

### Automated Testing (GitHub Actions)

The CI pipeline includes:

1. **HTML Validation**:

   ```bash
   npx htmlhint --config .htmlhintrc index.html
   ```

2. **JavaScript Syntax Check**:

   ```bash
   npx eslint --no-eslintrc --env browser,es2021 *.js
   ```

3. **Code Quality Checks**:

   - Viewport meta tag validation
   - HTTPS resource verification
   - Console.log statement detection

4. **Lighthouse CI** (Performance & Accessibility):
   - Runs on pull requests
   - Generates performance reports
   - Checks accessibility standards

### Manual Testing

```bash
# Install development dependencies
npm install --save-dev htmlhint eslint

# Run HTML validation
npx htmlhint index.html

# Run JavaScript linting
npx eslint --no-eslintrc --env browser *.js
```

## 🔌 API Integration (Optional)

### Mock API Setup

For testing API integration, you can use JSONPlaceholder or create a simple Express server:

```javascript
// server.js (optional backend for testing)
const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(express.json());

let expenses = [];

app.post("/api/expenses", (req, res) => {
  const expense = { id: Date.now(), ...req.body };
  expenses.push(expense);
  res.json(expense);
});

app.get("/api/expenses", (req, res) => {
  res.json(expenses);
});

app.listen(3001, () => {
  console.log("Mock API running on port 3001");
});
```

### API Configuration

The app automatically detects and uses the `EXPENSE_API_URL` environment variable:

```javascript
// Environment variable detection
const apiEndpoint = process.env.EXPENSE_API_URL || window.EXPENSE_API_URL;
```

## 📱 Features Overview

### User Interface

- **Modern Design**: Glass-morphism effects and gradient backgrounds
- **Responsive Layout**: Works on desktop, tablet, and mobile devices
- **Interactive Elements**: Smooth hover effects and animations
- **Accessibility**: Proper ARIA labels and keyboard navigation

### Data Management

- **LocalStorage Persistence**: Data survives browser restarts
- **Error Handling**: Graceful fallbacks for storage failures
- **Data Validation**: Client-side form validation
- **Demo Data**: Pre-populated sample expenses for new users

### Category System

- 🍔 Food & Dining
- 🚗 Transportation
- 🎬 Entertainment
- 💡 Utilities
- 🏥 Healthcare
- 🛍️ Shopping
- 📚 Education
- 🔧 Other

## 🚀 Deployment Options

### 1. Netlify (Recommended)

- **Automatic deployments** from GitHub
- **Environment variable management**
- **Custom domain support**
- **HTTPS by default**
- **Serverless functions** support

### 2. Vercel

```bash
npx vercel --prod
```

### 3. GitHub Pages

```bash
# Enable GitHub Pages in repository settings
# Select source: GitHub Actions
```

### 4. Firebase Hosting

```bash
firebase init hosting
firebase deploy
```

## 🔧 Customization

### Adding New Categories

1. **Update the HTML select options**:

```html
<option value="travel">✈️ Travel</option>
```

2. **Add to the JavaScript labels object**:

```javascript
const labels = {
  // existing categories...
  travel: "✈️ Travel",
};
```

### Styling Customization

Key CSS variables for theming:

```css
:root {
  --primary-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
  --secondary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  --background-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  --card-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
}
```

### Adding New Features

The modular JavaScript structure makes it easy to extend:

```javascript
class ExpenseTracker {
  // Add new methods here
  exportToCsv() {
    // CSV export functionality
  }

  generateReport() {
    // Monthly/yearly reports
  }
}
```

## 📊 Performance Optimization

### Implemented Optimizations

- **Efficient DOM updates**: Minimal reflows and repaints
- **Event delegation**: Optimized event handling
- **CSS animations**: Hardware-accelerated transforms
- **Responsive images**: Proper sizing and loading
- **Minimal dependencies**: No external libraries

### Lighthouse Scores Target

- **Performance**: 90+
- **Accessibility**: 95+
- **Best Practices**: 90+
- **SEO**: 90+

## 🐛 Troubleshooting

### Common Issues

1. **GitHub Actions failing**:

   ```bash
   # Check workflow syntax
   yamllint .github/workflows/validate.yml
   ```

2. **Netlify deployment issues**:

   ```bash
   # Check build logs in Netlify dashboard
   # Verify file paths and dependencies
   ```

3. **LocalStorage not working**:

   - Check browser privacy settings
   - Verify HTTPS in production
   - Test in incognito mode

4. **Environment variables not loading**:
   - Verify variable names in Netlify dashboard
   - Check for typos in variable references
   - Restart deployment after adding variables

### Debug Mode

Enable debug logging by adding to localStorage:

```javascript
localStorage.setItem("debug", "true");
```

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/new-feature`
3. **Commit changes**: `git commit -am 'Add new feature'`
4. **Push to branch**: `git push origin feature/new-feature`
5. **Create Pull Request**

### Development Guidelines

- Follow existing code style
- Add comments for complex logic
- Test on multiple browsers
- Update documentation as needed

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Netlify** for excellent hosting and CI/CD platform
- **GitHub Actions** for robust automation
- **HTMLHint** and **ESLint** for code quality tools
- **Modern CSS** techniques for responsive design

## 🔗 Links

- **Live Demo**: [Your Netlify URL]
- **Repository**: [Your GitHub Repository]
- **Issues**: [GitHub Issues Page]
- **Documentation**: [Additional Docs if any]

---

## 📈 Roadmap

### Phase 1 (Current)

- ✅ Basic expense tracking
- ✅ Local storage
- ✅ DevOps integration
- ✅ Responsive design

### Phase 2 (Future)

- [ ] User authentication
- [ ] Cloud data sync
- [ ] Advanced reporting
- [ ] Export functionality
- [ ] Budget limits and alerts
- [ ] Recurring expenses
- [ ] Multi-currency support

### Phase 3 (Advanced)

- [ ] Mobile app (PWA)
- [ ] Receipt scanning
- [ ] Bank integration
- [ ] AI expense categorization
- [ ] Financial insights

---

**Built with ❤️ and modern DevOps practices**
