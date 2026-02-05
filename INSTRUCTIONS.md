# Comprehensive Prompt: AKShare Documentation Scraping, Translation, and Mirroring for LLM Agent Execution

## Mission Statement

You are an expert AI agent tasked with scraping, translating, and mirroring the complete AKShare documentation ecosystem. Your mission is to create a fully functional English-language documentation hub that serves the global quantitative finance and data science community. The authoritative source for this project is the AKShare open-source Python library maintained at https://github.com/akfamily/akshare, and the primary documentation source to be mirrored is https://akshare.akfamily.xyz.

This is a production-grade workflow that requires careful attention to technical accuracy, consistent terminology, proper attribution, and sustainable maintenance practices. Execute each phase methodically, maintaining high quality standards throughout.

---

## Project Context and Background

### About AKShare

AKShare is a prestigious open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. The project is maintained at https://github.com/akfamily/akshare and has established itself as the definitive resource for accessing Chinese market data programmatically. The library serves quantitative researchers, financial analysts, algorithmic traders, and data scientists who require reliable access to China's $15+ trillion equity market and associated financial instruments.

The original AKShare project is written in Chinese and serves the domestic Chinese developer community with excellence. However, the global English-speaking quant community has significant barriers to entry due to language limitations. This documentation mirroring project aims to eliminate these barriers by providing complete, professionally translated English documentation while maintaining proper attribution to the original project.

### Primary Documentation Source

The documentation website to be mirrored is located at https://akshare.akfamily.xyz. This site contains:

- Installation and configuration guides
- Comprehensive API reference documentation
- Tutorials and usage examples
- Data source documentation
- Frequently asked questions
- Change logs and version history

All content originates from the AKShare project at https://github.com/akfamily/akshare, which serves as the authoritative source for both the library code and its documentation.

### Repository Reference

Throughout this project, maintain clear references to the original repository:

**Original Repository:** https://github.com/akfamily/akshare

**Primary Documentation Source:** https://akshare.akfamily.xyz

**This Translation/Mirror Project:** [Your GitHub Repository URL]

The relationship is one of translation and documentation mirroring—neither replacing nor forking the original codebase, but extending its reach to English-speaking audiences through professional documentation.

---

## Phase 1: Prerequisites and Environment Configuration

### Step 1.1: Python Environment Setup

Create a clean, isolated Python environment to handle all scraping, processing, and translation operations. Use Python 3.11 or higher for optimal compatibility with all required packages.

Execute the following commands to establish your development environment:

```bash
# Create conda environment
conda create -n akshare-mirror python=3.11
conda activate akshare-mirror

# Alternatively, create venv
python -m venv akshare-mirror-env
source akshare-mirror-env/bin/activate  # Linux/Mac
# or: akshare-mirror-env\Scripts\activate  # Windows

# Upgrade pip
pip install --upgrade pip setuptools wheel
```

### Step 1.2: Core Package Installation

Install the following packages in the order specified. Each package serves a specific function in the pipeline:

**Web Scraping and Content Extraction:**

```bash
pip install requests==2.31.0 beautifulsoup4==4.12.2 lxml==4.9.3
pip install playwright==1.40.0 selenium==4.15.2 httpx==0.25.2
python -m playwright install chromium  # Install browser binaries
```

**Content Processing and Document Handling:**

```bash
pip install python-docx==1.1.0 markdown==3.5.1 html2text==2020.1.16
pip install bleach==6.1.0 python-frontmatter==1.1.0 Pandoc==3.1.0
```

**Translation Services and Language Processing:**

```bash
pip install deep-translator==1.11.4 googletrans==4.0.0-rc1
pip install translatepy==1.16.2 openai==1.3.7 anthropic==0.8.1
pip install langchain==0.0.352
```

**Documentation Generation and Site Building:**

```bash
pip install mkdocs==1.5.3 mkdocs-material==9.4.8 mike==2.0.3
pip install mkdocs-awesome-pages-plugin==2.9.2
pip install mkdocs-git-revision-date-plugin==0.3.2
```

**Version Control and GitHub Operations:**

```bash
pip install GitPython==3.1.40 PyGithub==2.1.1 python-dotenv==1.0.0
```

**Data Handling and Utilities:**

```bash
pip install pandas==2.1.3 numpy==1.26.2 pyyaml==6.0.1
pip install tqdm==4.66.1 schedule==1.2.0 python-dateutil==2.8.2
```

### Step 1.3: API Configuration

Create a `.env` file in your project root with the following structure. These credentials enable automated translation and repository management:

```bash
# Translation API Keys (at least one required)
OPENAI_API_KEY=sk-your-openai-key-here
ANTHROPIC_API_KEY=sk-ant-your-anthropic-key-here
DEEPL_API_KEY=your-deepl-key-here

# GitHub Personal Access Token (required for repository creation)
# Create at: https://github.com/settings/tokens
# Scopes needed: repo, workflow
GITHUB_TOKEN=ghp-your-github-token-here

# Your GitHub username
GITHUB_USERNAME=your-github-username

# Repository configuration
REPO_NAME=akshare-english-docs
REPO_DESCRIPTION=English documentation mirror of AKShare - Open-source financial data interfaces for Chinese markets
```

### Step 1.4: Project Directory Structure

Create the following directory structure to organize your workflow:

```
akshare-mirror-project/
├── website_map/           # Phase 1: Website analysis outputs
├── scraped_content/       # Phase 2: Raw scraped HTML and data
├── processed_content/      # Phase 3: Cleaned, segmented content
├── translated_content/    # Phase 4: English translations
├── akshare-english-docs/  # Phase 5: Final documentation site
├── scripts/               # All Python automation scripts
├── notebooks/            # Research and analysis notebooks
├── config/               # Configuration files
├── logs/                 # Execution logs
├── .env                  # API credentials (DO NOT COMMIT)
├── requirements.txt      # Python dependencies
└── README.md             # Project overview
```

---

## Phase 2: Source Website Analysis

### Step 2.1: Comprehensive Website Discovery

Create and execute a website mapping script to discover all pages, understand the information architecture, and catalog content types. The documentation at https://akshare.akfamily.xyz follows a specific organizational pattern that must be preserved in the mirror.

Write a Python script that performs the following operations:

1. **Initial Page Fetch:** Retrieve the homepage and parse its navigation structure to understand the high-level organization.

2. **Recursive Link Discovery:** Crawl all internal links, tracking the complete site map including depth, frequency of access, and content categorization.

3. **Content Type Classification:** Categorize each discovered page by type (introduction, installation, API reference, tutorial, example, FAQ, changelog).

4. **Metadata Extraction:** For each page, extract title, headings hierarchy, code block count, table count, and estimated word count.

5. **Change Detection Preparation:** Generate content hashes to enable efficient incremental updates.

Execute the discovery script and save results in the `website_map/` directory with timestamped filenames.

### Step 2.2: Content Inventory Creation

Based on the discovered site structure, create a detailed content inventory that documents:

**Categorized URL List:**
- Introduction and overview pages
- Installation and setup guides
- API reference by module (stock, futures, fund, forex, bond, index, crypto)
- Tutorials organized by difficulty level
- Examples and use case documentation
- FAQ and troubleshooting guides
- Changelog and version history

**Estimated Translation Volume:**
- Total page count
- Total word count
- Code block count requiring preservation
- Table count requiring structural preservation

**Priority Classification:**
- Priority 1: Installation, quick start, and core API pages
- Priority 2: Data module documentation (stock, futures, fund, etc.)
- Priority 3: Tutorials and examples
- Priority 4: FAQ and supplementary materials

Save this inventory as `content_inventory.json` for pipeline processing.

---

## Phase 3: Web Scraping Implementation

### Step 3.1: Production Scraping Engine

Develop a robust scraping engine capable of handling the AKShare documentation site with the following requirements:

**Request Management:**
- Implement rate limiting to respect server resources (maximum 2 requests per second)
- Use session persistence for connection pooling
- Implement exponential backoff for retry logic
- Set appropriate timeouts (30 seconds primary, 60 seconds maximum)

**Content Extraction:**
- Extract complete HTML with all structural elements
- Preserve code blocks with exact formatting and syntax highlighting
- Capture all tables in structured format (headers, rows, cells)
- Extract internal and external links for validation
- Capture images and embedded media

**Error Handling:**
- Log all failures with specific error types
- Implement circuit breaker pattern for repeated failures
- Save partial progress to enable resume capability
- Generate failure report for manual review

**Caching:**
- Implement disk-based cache to avoid redundant requests
- Set cache validity period (24 hours recommended)
- Provide cache bypass option for forced updates

### Step 3.2: Scraped Content Storage

Save all scraped content in the `scraped_content/` directory with the following organization:

```
scraped_content/
├── html/              # Raw HTML files
│   └── [url_hash].html
├── markdown/          # Converted Markdown
│   └── [url_hash].md
├── json/             # Structured data
│   └── [url_hash].json
├── media/            # Downloaded images
│   └── [filename]
└── scraping_stats.json  # Execution statistics
```

Each JSON file should contain:
- Original URL
- Full HTML content
- Extracted text content
- Converted Markdown
- Metadata (title, headings, code blocks, tables)
- Processing timestamps
- Source content hash

---

## Phase 4: Content Processing Pipeline

### Step 4.1: Content Segmentation

Process raw scraped content into translation-ready segments:

**Heading-Based Segmentation:**
- Use document headings (H1, H2, H3) to create logical sections
- Preserve heading structure for TOC generation
- Maintain heading IDs for cross-references

**Code Block Identification:**
- Mark all code blocks as non-translatable
- Preserve language identifiers
- Maintain exact formatting and indentation

**Table Processing:**
- Convert HTML tables to structured formats (JSON, Markdown)
- Preserve header-row relationships
- Handle merged cells appropriately

**Link Processing:**
- Validate internal links within the scraped content
- Map relative URLs to absolute paths
- Mark external links for appropriate handling

### Step 4.2: Terminology Glossary Development

Build and maintain a comprehensive English-Chinese glossary based on the AKShare project's established terminology. This glossary ensures consistency across all translated content.

**Core Financial Terminology:**

| Chinese Term | English Translation | Category | Context |
|--------------|---------------------|----------|---------|
| 股票 | stock | financial | Equity shares listed on exchanges |
| A股 | A-shares | financial | Domestic RMB-denominated shares |
| 期货 | futures | financial | Derivative contracts for future delivery |
| 期权 | options | financial | Derivative contracts |
| ETF | ETF | financial | Exchange-Traded Fund |
| 债券 | bond | financial | Fixed income securities |

**Data Field Terminology:**

| Chinese Term | English Translation | Category | Context |
|--------------|---------------------|----------|---------|
| 开盘价 | open_price | data_field | Opening price for trading period |
| 收盘价 | close_price | data_field | Closing price for trading period |
| 最高价 | high_price | data_field | Highest price during period |
| 最低价 | low_price | data_field | Lowest price during period |
| 成交量 | volume | data_field | Trading volume in shares |
| 成交额 | trading_value | data_field | Total value traded |

**API and Technical Terminology:**

| Chinese Term | English Translation | Category | Context |
|--------------|---------------------|----------|---------|
| 函数 | function | api | Python function definition |
| 参数 | parameter | api | Function input argument |
| 返回值 | return_value | api | Value returned by function |
| 数据类型 | data_type | api | Type specification |
| 数据源 | data_source | api | Origin of data |

Save the glossary in multiple formats:
- JSON format for programmatic access
- Markdown format for human review
- CSV format for spreadsheet editing

---

## Phase 5: Translation Pipeline

### Step 5.1: Translation Service Configuration

Configure the translation pipeline to use multiple services with fallback capability. The primary service should be OpenAI GPT-4 for technical accuracy, with DeepL and Google Translate as fallbacks.

**OpenAI Configuration:**

```python
SYSTEM_PROMPT = """You are a professional technical translator specializing in Chinese to English translation for financial data, quantitative analysis, and Python programming documentation.

Translate the following Chinese text to English with these requirements:

1. TECHNICAL ACCURACY:
   - Translate all technical terms using established financial/data science terminology
   - Keep function names, parameter names, and code identifiers in English
   - Never translate content inside code blocks

2. TERMINOLOGY CONSISTENCY:
   - Use consistent translations for recurring terms
   - Reference the provided glossary for standard terms
   - Financial terms: 股票→stock, 期货→futures, 基金→fund

3. FORMATTING PRESERVATION:
   - Maintain all markdown formatting
   - Preserve links and image references
   - Keep paragraph structure

4. CLARITY:
   - Produce natural-sounding English technical documentation
   - Use active voice
   - Keep translations concise but complete

Output ONLY the translated text, no explanations."""
```

**Translation Segmenation:**

Segment long content into translatable chunks (maximum 8000 characters per chunk) while:
- Preserving code block boundaries
- Maintaining paragraph integrity
- Handling table structures appropriately

### Step 5.2: Batch Translation Execution

Execute translation in batches with progress tracking:

1. Load processed content pages from `processed_content/pages/`
2. For each page, translate all text sections
3. Preserve code blocks, tables, and technical elements
4. Save translated content to `translated_content/`

Monitor translation quality by:
- Tracking token usage and estimated costs
- Logging translation errors and fallback usage
- Spot-checking random samples for accuracy

---

## Phase 6: Documentation Generation

### Step 6.1: MkDocs Site Structure

Generate a complete MkDocs documentation site with the following structure:

```
akshare-english-docs/
├── docs/
│   ├── index.md                 # Homepage
│   ├── introduction.md          # Project overview
│   ├── installation.md          # Installation guide
│   ├── quickstart.md            # Quick start tutorial
│   ├── glossary.md              # English-Chinese glossary
│   ├── contributing.md          # Contribution guidelines
│   ├── changelog.md             # Version history
│   ├── api-reference/
│   │   ├── index.md            # API overview
│   │   ├── stock.md            # Stock data module
│   │   ├── futures.md           # Futures data module
│   │   ├── fund.md              # Fund data module
│   │   ├── forex.md             # Forex data module
│   │   ├── bond.md              # Bond data module
│   │   ├── index.md             # Index data module
│   │   └── crypto.md            # Crypto data module
│   ├── tutorials/
│   │   ├── index.md            # Tutorial overview
│   │   ├── beginner/
│   │   │   ├── 01-first-query.md
│   │   │   ├── 02-data-structures.md
│   │   │   └── 03-visualization.md
│   │   ├── intermediate/
│   │   │   ├── 01-trading-strategy.md
│   │   │   └── 02-backtesting.md
│   │   └── advanced/
│   │       ├── 01-quant-system.md
│   │       └── 02-ml-applications.md
│   └── examples/
│       ├── index.md            # Examples overview
│       ├── stock-analysis.md
│       ├── futures-trading.md
│       └── portfolio-opt.md
├── mkdocs.yml                   # Site configuration
├── requirements.txt             # Python dependencies
└── README.md                    # Repository README
```

### Step 6.2: Site Configuration

Configure `mkdocs.yml` with:

```yaml
site_name: AKShare English Documentation
site_description: The definitive English gateway to Chinese financial market data
site_author: AKShare Contributors
repo_url: https://github.com/akfamily/akshare
edit_uri: edit/main/docs/

theme:
  name: material
  palette:
    primary: blue
    accent: blue
  features:
    - navigation.tabs
    - navigation.sections
    - search.highlight
    - search.share

nav:
  - Home: index.md
  - Introduction: introduction.md
  - Installation: installation.md
  - Quick Start: quickstart.md
  - API Reference:
      - Overview: api-reference/index.md
      - Stock: api-reference/stock.md
      - Futures: api-reference/futures.md
      - Fund: api-reference/fund.md
      - Forex: api-reference/forex.md
      - Bond: api-reference/bond.md
      - Index: api-reference/index.md
      - Crypto: api-reference/crypto.md
  - Tutorials: tutorials/index.md
  - Examples: examples/index.md
  - Glossary: glossary.md
  - Contributing: contributing.md
  - Changelog: changelog.md

plugins:
  - search
  - git-revision-date
  - awesome-pages
```

### Step 6.3: Homepage Content

Create an engaging homepage at `docs/index.md`:

```markdown
# AKShare English Documentation

*The Definitive English Gateway to Chinese Financial Market Data*

> democratizing access to China's financial markets through open-source intelligence

## What Is AKShare?

[AKShare](https://github.com/akfamily/akshare) is an open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. Born from the conviction that language should never be a barrier to market insight, this project bridges the gap between the world's second-largest equity market and the global research community.

AKShare delivers clean, normalized access to:

| Market Segment | Data Types | Coverage |
|----------------|------------|----------|
| **Equities (A-Shares)** | Fundamentals, trade data | Shanghai, Shenzhen, Beijing exchanges |
| **Derivatives** | Futures, options, ETF data | CFFEX, SHFE, DCE, CZCE |
| **Funds** | Fund net value, manager info | Public mutual funds, QDII |
| **Fixed Income** | Bonds, SHIBOR | Government, corporate, policy bank |
| **Forex** | FX rates, interbank data | CNY, USD, major crosses |
| **Indices** | CSI, sector, thematic | Full historical series |
| **Crypto** | Spot, futures | Major exchanges |

## Quick Start

```bash
pip install akshare-english
```

```python
import akshare_english as ak

# Get real-time A-share market overview
market_summary = ak.stock_market_summary()

# Fetch CSI 300 index data
index_data = ak.index_zh_a_hist(
    symbol="000300",
    period="daily",
    start_date="2024-01-01"
)
```

## Documentation

- [Installation](installation.md) - Set up AKShare
- [Quick Start](quickstart.md) - Your first query
- [API Reference](api-reference/index.md) - Complete function documentation
- [Tutorials](tutorials/index.md) - Step-by-step guides
- [Examples](examples/index.md) - Real-world use cases

## Resources

- [GitHub Repository](https://github.com/akfamily/akshare)
- [Original Documentation (Chinese)](https://akshare.akfamily.xyz)
- [PyPI Package](https://pypi.org/project/akshare/)
- [Academic Citation](#)

## License

MIT License - See [LICENSE](https://github.com/akfamily/akshare/blob/main/LICENSE) for details.

---

<div align="center">

**AKShare English** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [PyPI](https://pypi.org/project/akshare/) • [Issues](https://github.com/akfamily/akshare/issues)

</div>
```

---

## Phase 7: GitHub Repository Setup

### Step 7.1: Repository Creation

Create a new GitHub repository with the following specifications:

**Repository Name:** `akshare-english-docs` (or your preferred name)

**Description:** English documentation mirror of AKShare - Open-source financial data interfaces for Chinese markets

**Visibility:** Public (recommended for community documentation)

**Initialization:**
- Add MIT License (same as original AKShare)
- Add Python .gitignore template
- Enable Issues and Wiki

### Step 7.2: Repository Structure Upload

Upload the complete documentation structure to GitHub:

```
akshare-english-docs/
├── docs/                    # MkDocs documentation source
├── notebooks/              # Jupyter research notebooks
├── scripts/                # Utility scripts
├── tests/                  # Documentation tests
├── .github/
│   └── workflows/          # CI/CD pipelines
├── mkdocs.yml             # Site configuration
├── requirements.txt       # Python dependencies
├── LICENSE                 # MIT License
├── README.md              # Repository README
└── CONTRIBUTING.md        # Contribution guidelines
```

### Step 7.3: GitHub Actions Workflow

Create `.github/workflows/docs.yml`:

```yaml
name: Documentation CI

on:
  push:
    branches: [main]
    paths:
      - 'docs/**'
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
    
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'
    
      - name: Install dependencies
        run: |
          pip install mkdocs mkdocs-material
    
      - name: Validate Markdown links
        run: |
          pip install markdown-link-check
          find docs -name "*.md" -exec markdown-link-check {} \;
    
      - name: Build documentation
        run: mkdocs build
    
      - name: Deploy to GitHub Pages
        if: github.ref == 'refs/heads/main'
        run: mkdocs gh-deploy --force
```

### Step 7.4: Attribution Header

Add clear attribution to every documentation file:

```markdown
---
title: [Page Title]
description: [Brief description]
---

# [English Title]

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz). 
> The authoritative source for this project is the [AKShare GitHub repository](https://github.com/akfamily/akshare).

*[Back to original Chinese documentation →](https://akshare.akfamily.xyz/)*

## Content

[Translated content...]
```

---

## Phase 8: Repository README Creation

Create a comprehensive README for the GitHub repository:

```markdown
# AKShare English Documentation

## *The Definitive English Gateway to Chinese Financial Market Data*

> democratizing access to China's financial markets through open-source intelligence

---

**AKShare** is an open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. This repository contains the official English translation of AKShare documentation.

### About AKShare

[AKShare](https://github.com/akfamily/akshare) is created and maintained by **Albert King** and has processed over 2 million data points daily from publicly available Chinese sources. The library transforms raw HTML, JSON feeds, and PDF disclosures into clean, pandas-compatible dataframes.

### Documentation

- **📖 [Read the Docs](https://akshare-english.readthedocs.io/)** - Browse the full documentation
- **🚀 [Quick Start](docs/quickstart.md)** - Get started in 5 minutes
- **📚 [API Reference](docs/api-reference/)** - Complete function documentation
- **📓 [Jupyter Notebooks](notebooks/)** - Interactive examples

### Quick Start

```bash
pip install akshare-english
```

```python
import akshare_english as ak

# Get real-time A-share market overview
market_summary = ak.stock_market_summary()

# Fetch fundamentals for Kweichow Moutai
fundamentals = ak.stock_fundamental_flow(
    symbol="600519",
    period="annual"
)

# Retrieve CSI 300 index data
index_data = ak.index_zh_a_hist(
    symbol="000300",
    period="daily",
    start_date="2024-01-01"
)
```

### Data Coverage

| Market | Coverage |
|--------|----------|
| **Equities** | Shanghai, Shenzhen, Beijing exchanges (A-shares, B-shares, HK-shares) |
| **Derivatives** | CFFEX, SHFE, DCE, CZCE (futures, options) |
| **Funds** | Public mutual funds, QDII, ETF NAV |
| **Fixed Income** | Government bonds, corporate bonds, policy bank bonds, SHIBOR |
| **Forex** | CNY, USD, major currency crosses |
| **Indices** | CSI 300/500/1000, sector indexes, thematic indexes |
| **Crypto** | Spot and futures from major exchanges |

### Resources

| Resource | Link |
|----------|------|
| **Original AKShare** | [GitHub](https://github.com/akfamily/akshare) |
| **Chinese Docs** | [akshare.akfamily.xyz](https://akshare.akfamily.xyz) |
| **PyPI Package** | [pypi.org/project/akshare](https://pypi.org/project/akshare/) |
| **Issues** | [GitHub Issues](https://github.com/akfamily/akshare/issues) |
| **Academic Citation** | See [CITATION.cff](CITATION.cff) |

### Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for details.

### License

AKShare is released under the **MIT License**.

Copyright © 2022-present, Albert King. See [LICENSE](LICENSE) for details.

---

<div align="center">

**🌏 Bridging China's Markets to the World**

[AKShare](https://github.com/akfamily/akshare) | [Documentation](https://akshare-english.readthedocs.io/) | [Issues](https://github.com/akfamily/akshare/issues)

</div>
```

---

## Phase 9: Maintenance and Updates

### Step 9.1: Incremental Update Process

To update the mirrored documentation with changes from the source:

**1. Check for Updates:**

```python
#!/usr/bin/env python3
"""Check for documentation updates."""

import hashlib
import json
from pathlib import Path

def check_updates(source_urls_file, previous_hashes_file):
    """Identify pages that have changed."""
    with open(source_urls_file) as f:
        urls = [line.strip() for line in f if line.strip()]
  
    with open(previous_hashes_file) as f:
        previous_hashes = json.load(f)
  
    changed_pages = []
    for url in urls:
        # Fetch current content and compute hash
        response = requests.get(url)
        current_hash = hashlib.md5(response.content).hexdigest()
      
        if url not in previous_hashes or previous_hashes[url] != current_hash:
            changed_pages.append(url)
  
    return changed_pages
```

**2. Execute Update Workflow:**

```bash
# Phase 2: Scrape changed pages only
python akshare_scraper.py --urls changed_urls.txt --update-mode

# Phase 3: Process new content
python content_processor.py --incremental

# Phase 4: Translate new content
python translation_pipeline.py --new-only

# Phase 5: Regenerate documentation
python documentation_generator.py --update

# Phase 6: Commit and push
git add .
git commit -m "Update: $(date -Iseconds)"
git push
```

### Step 9.2: Cron Schedule for Automatic Updates

Add to crontab for regular synchronization:

```bash
# Update documentation every Sunday at 2 AM
0 2 * * 0 cd /path/to/akshare-english-docs && python scripts/mirror_update.py >> /var/log/akshare-docs.log 2>&1

# Check for updates daily at 6 AM
0 6 * * * cd /path/to/akshare-english-docs && python scripts/check_updates.py --notify-only
```

---

## Phase 10: Quality Assurance Checklist

Before deploying or committing documentation updates, verify:

### Content Verification

- [ ] All pages from source URL are represented
- [ ] No missing code blocks or syntax highlighting
- [ ] Tables maintain proper structure
- [ ] Internal links resolve correctly
- [ ] External links are valid
- [ ] Images are present and accessible
- [ ] Navigation hierarchy is preserved

### Translation Quality

- [ ] Technical terminology is consistent
- [ ] Code examples are preserved exactly
- [ ] No untranslated Chinese text remains
- [ ] Grammar and spelling are correct
- [ ] Style is consistent across pages
- [ ] Glossary terms are used appropriately

### Repository Health

- [ ] Git status shows clean state
- [ ] Commit messages are descriptive
- [ ] No sensitive data in commits (API keys, tokens)
- [ ] CI/CD pipelines pass
- [ ] Documentation builds successfully
- [ ] Links to original AKShare repository are present

### Attribution Verification

- [ ] Every page references the original AKShare repository
- [ ] Link to https://github.com/akfamily/akshare is present
- [ ] Link to https://akshare.akfamily.xyz is present for source reference
- [ ] License file is present and correct

---

## Output Specifications

### Directory Structure Final State

```
akshare-english-docs/
├── .github/
│   └── workflows/
│       └── docs.yml
├── docs/
│   ├── index.md
│   ├── introduction.md
│   ├── installation.md
│   ├── quickstart.md
│   ├── glossary.md
│   ├── contributing.md
│   ├── changelog.md
│   ├── api-reference/
│   ├── tutorials/
│   └── examples/
├── notebooks/
├── scripts/
├── tests/
├── mkdocs.yml
├── requirements.txt
├── LICENSE
├── README.md
├── CITATION.cff
└── .gitignore
```

### GitHub Repository Settings

- **Repository Description:** English documentation mirror of AKShare - Open-source financial data interfaces for Chinese markets
- **Topics:** python, finance, data, documentation, china, stocks, futures, forex, crypto, akshare
- **Wiki:** Enabled
- **Issues:** Enabled
- **Projects:** Enabled
- **Actions:** Enabled

### Deploy Documentation

Enable GitHub Pages in repository settings:
- **Source:** Deploy from a branch
- **Branch:** gh-pages / (root)
- **Build:** MkDocs will deploy automatically via GitHub Actions

---

## Reference Links Summary

Maintain these references throughout the documentation:

| Purpose | URL |
|---------|-----|
| **Original AKShare Repository** | https://github.com/akfamily/akshare |
| **Chinese Documentation Source** | https://akshare.akfamily.xyz |
| **English Documentation Site** | https://[your-username].github.io/akshare-english-docs |
| **PyPI Package** | https://pypi.org/project/akshare/ |
| **Issue Tracker** | https://github.com/akfamily/akshare/issues |

---

## Execution Summary

Execute this prompt in sequential phases:

```
Phase 1: Environment Setup        → 10-15 minutes
Phase 2: Website Analysis         → 5-10 minutes
Phase 3: Web Scraping            → 30-60 minutes (depending on page count)
Phase 4: Content Processing       → 15-20 minutes
Phase 5: Translation             → Variable (API costs apply)
Phase 6: Documentation Generation → 10-15 minutes
Phase 7: GitHub Repository Setup → 10-15 minutes
Phase 8: Quality Verification    → 15-30 minutes
Total Estimated Time:             → 2-4 hours for initial setup
```

Upon completion, you will have produced a professional, fully functional English documentation mirror of AKShare, properly attributed to the original project at https://github.com/akfamily/akshare, ready to serve the global quantitative finance community.
