## 📊 What Is akshare-english?

akshare-english is the **authoritative English translation and documentation project** for AKShare — the open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. Born from the conviction that language should never be a barrier to market insight, this project bridges the gap between the world's second-largest equity market and the global research community.

AKShare delivers clean, normalized access to:

| Market Segment | Data Types | Coverage |
|----------------|------------|----------|
| **Equities (A-Shares)** | Fundamentals, fundamentals-2, trade data, fundamentals-pro | Shanghai, Shenzhen, Beijing exchanges |
| **Derivatives** | Futures, options, ETF data | CFFEX, SHFE, DCE, CZCE |
| **Funds** | Fund net value, fund manager info | Public mutual funds, QDII |
| **Fixed Income** | Bonds, CBEX, SHIBOR | Government, corporate, policy bank |
| **Forex & Money** | FX rates, interbank data | CNY, USD, major crosses |
| **Indices** | CSI, sector, thematic indexes | Full historical series |
| **Crypto** | Spot, futures, on-chain metrics | Major exchanges |

---

## 💎 Sponsor

<div align="center">

**✨ This project is proudly sponsored by**

### [YuanTrends](https://yuantrends.com) | [@YuanTrends](https://x.com/YuanTrends)

Your authoritative source for in-depth analysis of China and Hong Kong equities markets. Delivering financial news at the speed of light — insights that move markets and shape investment strategies. 💼🌊

---

### [Etherdeep](https://etherdeep.com) | [@EtherdeepTrade](https://x.com/EtherdeepTrade)

An AI-driven global macro trading lab leveraging cutting-edge artificial intelligence to analyze and predict moves in financial markets. 🌍⚡

</div>

---

## 🚀 Quick Start

```bash
# Install the core library
pip install akshare-english

# Or use the HTTP API (no Python required)
# Visit: https://aktools.io
```

### Your First Query

```python
import akshare_english as ak

# Get real-time A-share market overview
market_summary = ak.stock_market_summary()

# Fetch fundamentals for a specific ticker
fundamentals = ak.stock_fundamental_flow(
    symbol="600519",  # Kweichow Moutai
    period="annual"
)

# Retrieve CSI 300 index data
index_data = ak.index_zh_a_hist(
    symbol="000300",  # CSI 300
    period="daily",
    start_date="2024-01-01",
    end_date="2024-12-31"
)
```

---

## 📁 Project Structure

```
akshare-english/
│
├── 📖 docs/                    # Comprehensive documentation
│   ├── getting-started/        # Installation & configuration
│   ├── tutorials/              # Step-by-step guides
│   ├── api-reference/         # Complete function documentation
│   └── examples/              # Real-world use cases
│
├── 🐍 akshare_english/         # Core Python package
│   ├── stock/                  # Equity data interfaces
│   ├── futures/                # Derivatives data
│   ├── fund/                   # Fund and ETF data
│   ├── forex/                  # Currency markets
│   ├── bond/                   # Fixed income
│   ├── crypto/                 # Digital assets
│   └── utils/                  # Helper functions
│
├── 🌐 aktools/                 # HTTP API service
│   ├── endpoints/              # REST API definitions
│   ├── documentation/          # OpenAPI specs
│   └── client-samples/         # JavaScript, Go, Rust samples
│
├── 🧪 tests/                   # Unit and integration tests
├── 📊 notebooks/              # Jupyter research notebooks
└── 🤝 contributing/            # Contribution guidelines
```

---

## 🔗 Data Source Architecture

AKShare employs a **multi-layer validation architecture** to ensure data integrity:

```
┌─────────────────────────────────────────────────────────────┐
│                    USER QUERY                              │
└─────────────────────────┬───────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│                 NORMALIZATION LAYER                         │
│   • Schema standardization across exchanges                 │
│   • Timestamp normalization (UTC/CST)                      │
│   • Symbol mapping (ticker ↔ name ↔ ISIN)                  │
└─────────────────────────┬───────────────────────────────────┘
                          │
          ┌───────────────┼───────────────┐
          ▼               ▼               ▼
    ┌──────────┐   ┌──────────┐   ┌──────────┐
    │ SOURCE A │   │ SOURCE B │   │ SOURCE C │
    │(Official │   │(Third    │   │(Academic │
    │ Exchanges)│   │ Party APIs)│   │ Repos)  │
    └────┬─────┘   └────┬─────┘   └────┬─────┘
         │              │              │
         └──────────────┼──────────────┘
                        ▼
              ┌──────────────────┐
              │ CROSS-VALIDATION  │
              │ & ERROR CHECKING  │
              └──────────────────┘
```

---

## 📈 Core Capabilities

### 1. Market Data (实时与历史)

**Equities**
- Real-time quotes and order books
- Historical OHLCV data (daily, weekly, monthly)
- Trading halts, circuit breakers, auction data
- Margin trading (融资融券) statistics

**Indices**
- CSI 300, CSI 500, CSI 1000
- Sector and thematic classifications
- Index futures and options

### 2. Fundamentals (基本面数据)

**Corporate Disclosure**
- Annual/quarterly reports (PDF and structured)
- Dividend announcements
- Shareholder structure changes
- Management discussions

**Financial Statements**
- Income statements (利润表)
- Balance sheets (资产负债表)
- Cash flow statements (现金流量表)
- Computed ratios and metrics

### 3. Derivatives (衍生品)

- Futures contracts (IF, IC, IH, RU, CU, etc.)
- Options pricing and Greeks
- ETF net asset values and creation/redemption flows

### 4. Alternative Data (另类数据)

- Fund manager holdings and performance
- Analyst ratings and price targets
- ESG scores and climate metrics
- Insider trading and share buyback announcements

---

## 🛠️ Integration Ecosystem

akshare-english seamlessly integrates with the modern data stack:

```
┌──────────────────────────────────────────────────────────────┐
│                     ANALYSIS LAYERS                          │
│  Jupyter │ pandas │ NumPy │ SciPy │ scikit-learn │ TensorFlow │
└──────────────────────────────────────────────────────────────┘
                            ▲
                            │
┌──────────────────────────────────────────────────────────────┐
│                     DATA ACCESS                              │
│      akshare-english │ SQL clients │ REST APIs             │
└──────────────────────────────────────────────────────────────┘
                            ▲
                            │
┌──────────────────────────────────────────────────────────────┐
│                    DATA SOURCES                              │
│      Chinese Exchanges │ CSRC │ PBOC │ Wind │ Bloomberg    │
└──────────────────────────────────────────────────────────────┘
```

---

## 📚 Documentation Navigation

| Topic | Description |
|-------|-------------|
| **Getting Started** | Installation, configuration, your first query |
| **Tutorials** | Step-by-step guides for common use cases |
| **API Reference** | Complete function documentation with examples |
| **Examples** | Real research notebooks and trading strategies |
| **Contributing** | How to submit issues, PRs, and new data interfaces |
| **FAQ** | Common questions and troubleshooting |

---

## 🏆 Academic Citation

If AKShare has contributed to your research, please cite:

```bibtex
@misc{akshare2022,
    author = {Albert King},
    title = {AKShare},
    year = {2022},
    publisher = {GitHub},
    journal = {GitHub repository},
    howpublished = {\url{https://github.com/akfamily/akshare}},
}
```

---

## ⚠️ Important Disclaimers

### Data Usage Notice

> AKShare aggregates data from publicly available sources. While we validate and clean data rigorously, **we cannot guarantee absolute accuracy**. All data is provided for **academic research purposes only**.

### Trading and Investment Risk

> **Never** use AKShare data as the sole basis for investment decisions. Market data delays, source errors, and data processing limitations may exist. Always cross-reference with official exchange feeds and professional terminals for trading applications.

### Regulatory Compliance

> Users are responsible for complying with their local regulations regarding financial data usage. Some data may be subject to licensing restrictions for commercial applications.

---

## 🤝 Community & Support

| Channel | Purpose |
|---------|---------|
| **GitHub Issues** | Bug reports, feature requests, data interface issues |
| **Discussions** | Q&A, best practices, research collaboration |
| **Discord** | Real-time community chat |
| **Email** | Core team communication |

---

## 📜 License

AKShare is released under the **MIT License**.

Copyright © 2022-present, Albert King. All rights reserved.

---

<div align="center">

### 🌏 *Bridging China's Markets to the World*

**akshare-english** | *Open Data. Open Minds.*

[![GitHub Stars](https://img.shields.io/github/stars/akfamily/akshare?style=for-the-badge)](https://github.com/akfamily/akshare)
[![Python 3.12+](https://img.shields.io/badge/python-3.12-blue?style=for-the-badge)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](https://opensource.org/licenses/MIT)

</div>
```
