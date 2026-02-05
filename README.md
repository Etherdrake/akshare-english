# AKShare English Documentation

*The Definitive English Gateway to Chinese Financial Market Data*

> democratizing access to China's financial markets through open-source intelligence

---

**AKShare** is an open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. This repository contains the official English translation of AKShare documentation.

## 📖 Live Documentation

**👉 [https://Etherdrake.github.io/akshare-english/](https://Etherdrake.github.io/akshare-english/)**

---

## About AKShare

[AKShare](https://github.com/akfamily/akshare) is created and maintained by **Albert King** and has processed over 2 million data points daily from publicly available Chinese sources. The library transforms raw HTML, JSON feeds, and PDF disclosures into clean, pandas-compatible dataframes.

## Quick Start

```bash
pip install akshare
```

```python
import akshare as ak

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

## Data Coverage

| Market | Coverage |
|--------|----------|
| **Equities** | Shanghai, Shenzhen, Beijing exchanges (A-shares, B-shares, HK-shares) |
| **Derivatives** | CFFEX, SHFE, DCE, CZCE (futures, options) |
| **Funds** | Public mutual funds, QDII, ETF NAV |
| **Fixed Income** | Government bonds, corporate bonds, policy bank bonds, SHIBOR |
| **Forex** | CNY, USD, major currency crosses |
| **Indices** | CSI 300/500/1000, sector indexes, thematic indexes |
| **Crypto** | Spot and futures from major exchanges |

## Documentation

| Guide | File |
|-------|------|
| **🚀 Quick Start** | [docs/quickstart.md](docs/quickstart.md) |
| **📚 API Tutorial** | [docs/tutorial.md](docs/tutorial.md) |
| **💻 Installation** | [docs/installation.md](docs/installation.md) |
| **📊 Indicators** | [docs/indicators.md](docs/indicators.md) |
| **📈 Strategies** | [docs/strategies.md](docs/strategies.md) |
| **🐳 Docker** | [docs/docker.md](docs/docker.md) |
| **❓ FAQ** | [docs/faq.md](docs/faq.md) |

## Documentation Structure

```
docs/
├── index.md              # Homepage
├── introduction.md       # Project overview
├── installation.md       # Installation guide
├── quickstart.md         # Quick start tutorial
├── tutorial.md           # Complete API tutorial
├── strategies.md         # Trading strategies
├── indicators.md        # Technical indicators
├── data-tips.md         # Data usage tips
├── trading.md           # Live trading integration
├── platform.md          # Platform integration
├── environment.md       # Environment setup
├── http-deploy.md       # HTTP API deployment
├── docker.md           # Docker deployment
├── contributing.md     # Contribution guide
├── changelog.md        # Version history
├── faq.md              # FAQ
├── articles.md         # Related articles
├── special.md          # Special notes
└── data/
    └── index.md        # API reference index
```

## Resources

| Resource | Link |
|----------|------|
| **🌐 Live Docs** | https://Etherdrake.github.io/akshare-english/ |
| **📚 Original Docs** | https://akshare.akfamily.xyz |
| **🐙 GitHub** | https://github.com/akfamily/akshare |
| **📦 PyPI** | https://pypi.org/project/akshare |
| **🐛 Issues** | https://github.com/akfamily/akshare/issues |
| **🔧 AKTools** | https://aktools.akfamily.xyz/ |

## Contributing

Contributions are welcome! Please read our [Contributing Guide](docs/contributing.md) for details.

## License

AKShare is released under the **MIT License**.

Copyright © 2022-present, Albert King. See [LICENSE](LICENSE) for details.

---

<div align="center">

**🌏 Bridging China's Markets to the World**

[🌐 Live Docs](https://Etherdrake.github.io/akshare-english/) | [GitHub](https://github.com/akfamily/akshare) | [Issues](https://github.com/akfamily/akshare/issues)

</div>
