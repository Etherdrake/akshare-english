# AKShare English Documentation - Run Instructions

This repository contains the complete English translation of AKShare documentation.

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/akshare-english.git
cd akshare-english
```

### 2. Set Up Python Environment (Optional - for running examples)

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# or: venv\Scripts\activate  # Windows

# Install AKShare
pip install akshare --upgrade

# For China users
pip install akshare -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 3. Verify Installation

```python
import akshare as ak

# Print version
print(ak.__version__)
print(ak.__author__)

# Get market data
market = ak.stock_market_summary()
print(market.head())
```

---

## Documentation Structure

```
akshare-english/
├── README.md                 # Main README
├── RUN.md                    # This file
├── LICENSE                   # MIT License
├── docs/
│   ├── index.md             # Documentation homepage
│   ├── introduction.md      # Project overview
│   ├── installation.md       # Installation guide
│   ├── quickstart.md         # Quick start tutorial
│   ├── tutorial.md           # Complete API tutorial
│   ├── contributing.md      # Contribution guidelines
│   ├── changelog.md         # Version history
│   ├── faq.md               # FAQ
│   ├── dependency.md        # Dependencies
│   ├── trading.md           # Live trading guide
│   ├── environment.md        # Environment setup
│   ├── platform.md          # Platform integration
│   ├── strategies.md        # Strategy examples
│   ├── articles.md          # Related articles
│   ├── indicators.md        # Technical indicators
│   ├── data-tips.md         # Data usage tips
│   ├── http-deploy.md       # HTTP API deployment
│   ├── docker.md            # Docker deployment
│   ├── special.md           # Special notes
│   └── data/
│       └── index.md         # API reference
└── notebooks/               # Jupyter notebooks (optional)
```

---

## Running Documentation Locally

### Using MkDocs (Recommended)

```bash
# Install mkdocs
pip install mkdocs mkdocs-material

# Serve locally
mkdocs serve

# View at http://localhost:8000
```

### Using Sphinx

```bash
# Install sphinx
pip install sphinx sphinx_rtd_theme

# Build documentation
sphinx-build -b html docs/ _build/html

# Serve
cd _build/html && python -m http.server 8000
```

---

## Running Examples

### Basic Example

```python
import akshare as ak

# Get real-time market summary
market = ak.stock_market_summary()
print(market)
```

### Stock Data Example

```python
import akshare as ak

# Get historical A-share data
df = ak.stock_zh_a_daily(
    symbol="600519",  # Kweichow Moutai
    start_date="2024-01-01",
    end_date="2024-01-31"
)
print(df.head())
```

### Index Data Example

```python
import akshare as ak

# Get CSI 300 index data
df = ak.index_zh_a_hist(
    symbol="000300",
    period="daily",
    start_date="2024-01-01",
    end_date="2024-01-31"
)
print(df.head())
```

---

## Testing AKShare

### Run Basic Tests

```python
import akshare as ak

def test_installation():
    """Test AKShare installation."""
    print(f"Version: {ak.__version__}")
    print(f"Author: {ak.__author__}")
    return True

def test_market_data():
    """Test market data retrieval."""
    try:
        market = ak.stock_market_summary()
        assert not market.empty
        print(f"Market data: {len(market)} entries")
        return True
    except Exception as e:
        print(f"Error: {e}")
        return False

def test_stock_data():
    """Test stock data retrieval."""
    try:
        df = ak.stock_zh_a_daily(symbol="600519", start_date="2024-01-01")
        assert not df.empty
        print(f"Stock data: {len(df)} entries")
        return True
    except Exception as e:
        print(f"Error: {e}")
        return False

# Run tests
if __name__ == "__main__":
    test_installation()
    test_market_data()
    test_stock_data()
```

---

## Docker Deployment

### Build Documentation Image

```dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
```

### Run with Docker

```bash
# Build
docker build -t akshare-docs .

# Run
docker run -p 8000:8000 akshare-docs
```

---

## Updating Documentation

### Pull Latest Changes

```bash
git fetch origin
git pull origin main
```

### Sync with Original

```bash
# Fetch from original repo
git remote add original https://github.com/akfamily/akshare.git
git fetch original
git merge original/latest --allow-unrelated-histories
```

---

## Troubleshooting

### 1. Import Errors

```bash
# Reinstall AKShare
pip uninstall akshare
pip install akshare --upgrade

# Check Python version
python --version  # Must be 3.8+
```

### 2. Network Issues

```bash
# Use China mirror
pip install akshare -i https://pypi.tuna.tsinghua.edu.cn/simple

# Check connection
curl https://akshare.akfamily.xyz
```

### 3. Data Not Loading

```bash
# Check date format
# Use YYYY-MM-DD format

# Verify symbol
print(ak.stock_zh_a_spot_em().head())
```

---

## Additional Resources

| Resource | URL |
|----------|-----|
| **Original Docs** | https://akshare.akfamily.xyz |
| **GitHub** | https://github.com/akfamily/akshare |
| **PyPI** | https://pypi.org/project/akshare |
| **Issues** | https://github.com/akfamily/akshare/issues |
| **AKTools** | https://aktools.akfamily.xyz |

---

## GitHub Deployment

### GitHub Pages (Recommended)

#### 1. Create GitHub Repository

```bash
# Create repo on GitHub, then:
git init
git add .
git commit -m "Initial commit: AKShare English documentation"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/akshare-english.git
git push -u origin main
```

#### 2. Enable GitHub Pages

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select:
   - **Branch:** `main` (or `gh-pages`)
   - **Folder:** `/ (root)` or `/docs`
4. Click **Save**

#### 3. Access Your Documentation

Your documentation will be available at:
```
https://YOUR-USERNAME.github.io/akshare-english/
```

---

### Using mkdocs-material for GitHub Pages

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages
on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Install dependencies
        run: |
          pip install mkdocs mkdocs-material
      
      - name: Build documentation
        run: mkdocs gh-deploy --force
```

**Enable Actions:**
1. Go to repository **Settings** → **Actions** → **General**
2. Select **Allow all actions**
3. Commit the workflow file
4. Push to trigger automatic deployment

---

### Using Sphinx for GitHub Pages

Create `.github/workflows/docs.yml`:

```yaml
name: Sphinx Docs
on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Install dependencies
        run: |
          pip install sphinx sphinx_rtd_theme
          pip install -r docs/requirements.txt
      
      - name: Build
        run: sphinx-build -b html docs/ _build/html
      
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: _build/html
```

---

## License

This documentation is distributed under the MIT License. See [LICENSE](LICENSE) for details.

---

**AKShare** - Democratizing Access to China's Financial Markets

[GitHub](https://github.com/akfamily/akshare) | [Documentation](https://akshare.akfamily.xyz)
