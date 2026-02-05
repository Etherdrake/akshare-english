# AKShare English Documentation

*The Definitive English Gateway to Chinese Financial Market Data*

> democratizing access to China's financial markets through open-source intelligence

---

**AKShare** is an open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. This repository contains the official English translation of AKShare documentation.

## About AKShare

[AKShare](https://github.com/akfamily/akshare) is created and maintained by **Albert King** and has processed over 2 million data points daily from publicly available Chinese sources. The library transforms raw HTML, JSON feeds, and PDF disclosures into clean, pandas-compatible dataframes.

## Documentation

- **[📖 Read the Docs](https://akshare-english.readthedocs.io/)** - Browse the full documentation
- **[🚀 Quick Start](docs/quickstart.md)** - Get started in 5 minutes
- **[📚 API Reference](docs/api-reference/)** - Complete function documentation
- **[📓 Notebooks](notebooks/)** - Interactive examples

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

## Documentation Structure

```
docs/
├── index.md              # Homepage
├── introduction.md       # Project overview
├── installation.md       # Installation guide
├── quickstart.md         # Quick start tutorial
├── data_dictionary.md    # Data reference
├── indicators.md         # Technical indicators
├── data_tips.md          # Data usage tips
├── trading.md            # Live trading integration
├── faq.md                # Frequently asked questions
├── tutorial.md           # Tutorials
├── articles.md           # Related articles
├── environment.md        # Environment setup
├── platform.md          # Quantitative platforms
├── demo.md              # Strategy examples
├── changelog.md          # Version history
├── contributing.md       # Contribution guidelines
├── dependency.md         # Dependencies
├── http_deploy.md        # HTTP API deployment
├── docker.md            # Docker deployment
└── special.md           # Special notes
```

## Resources

| Resource | Link |
|----------|------|
| **Original AKShare** | [GitHub](https://github.com/akfamily/akshare) |
| **Chinese Docs** | [akshare.akfamily.xyz](https://akshare.akfamily.xyz) |
| **PyPI Package** | [pypi.org/project/akshare](https://pypi.org/project/akshare/) |
| **Issues** | [GitHub Issues](https://github.com/akfamily/akshare/issues) |
| **AKTools (HTTP API)** | [aktools.akfamily.xyz](https://aktools.akfamily.xyz/) |

## Contributing

Contributions are welcome! Please read our [Contributing Guide](docs/contributing.md) for details.

## License

AKShare is released under the **MIT License**.

Copyright © 2022-present, Albert King. See [LICENSE](LICENSE) for details.

---

<div align="center">

**🌏 Bridging China's Markets to the World**

[AKShare](https://github.com/akfamily/akshare) | [Documentation](https://akshare.akfamily.xyz) | [Issues](https://github.com/akfamily/akshare/issues)

</div>
