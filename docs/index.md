# AKShare - English Documentation

*The Definitive English Gateway to Chinese Financial Market Data*

> democratizing access to China's financial markets through open-source intelligence

---

## What is AKShare?

[AKShare](https://github.com/akfamily/akshare) is an open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. Created by Albert King, it has become the definitive resource for accessing China's $15+ trillion equity market programmatically.

## Key Features

- **Comprehensive Coverage:** Stocks, futures, options, funds, forex, bonds, indices, crypto
- **Clean Data:** Normalized, validated, and pandas-compatible outputs
- **Well Documented:** Every function includes detailed documentation and examples
- **Active Development:** Regular updates and maintenance
- **Multi-Language:** Python, R, MATLAB, HTTP API support

## Quick Start

```bash
pip install akshare --upgrade
```

```python
import akshare as ak

# Get real-time market summary
market = ak.stock_market_summary()
print(market)

# Get historical stock data
stock = ak.stock_zh_a_hist(
    symbol="000001",
    period="daily",
    start_date="2024-01-01"
)
print(stock)
```

## Data Coverage

| Market | Data Types | Coverage |
|--------|------------|----------|
| **Equities (A/B/H shares)** | Fundamentals, OHLCV | Shanghai, Shenzhen, Beijing, Hong Kong |
| **Derivatives** | Futures, Options, ETF | CFFEX, SHFE, DCE, CZCE |
| **Funds** | NAV, Holdings, Managers | Public mutual funds, QDII |
| **Fixed Income** | Bonds, Rates | Government, corporate, SHIBOR |
| **Forex** | Spot rates | CNY, USD, major crosses |
| **Indices** | CSI, Sector, Thematic | Full historical series |
| **Crypto** | Spot, Futures | Major exchanges |

## Documentation

### Getting Started

- [Introduction](introduction.md) - Project overview
- [Installation](installation.md) - Setup guide
- [Quick Start](quickstart.md) - First query tutorial
- [FAQ](faq.md) - Common questions

### Core Documentation

- [API Reference](data/index.md) - Complete function documentation
- [Indicators](indicator.md) - Technical indicator calculations
- [Data Tips](data_tips.md) - Usage guidance

### Advanced Topics

- [Trading Integration](trade.md) - Live trading connections
- [Strategy Examples](demo.md) - Quant strategy examples
- [HTTP Deployment](http_deploy.md) - AKTools deployment
- [Docker Deployment](docker.md) - Container deployment

### Reference

- [Changelog](changelog.md) - Version history
- [Contributing](contributing.md) - How to contribute
- [Dependencies](dependency.md) - Package requirements

## Resources

| Resource | Link |
|----------|------|
| **GitHub** | https://github.com/akfamily/akshare |
| **PyPI** | https://pypi.org/project/akshare |
| **Original Docs** | https://akshare.akfamily.xyz |
| **HTTP API (AKTools)** | https://aktools.akfamily.xyz |
| **Issues** | https://github.com/akfamily/akshare/issues |

## Citation

If you use AKShare in your research, please cite:

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

## License

MIT License - See [LICENSE](https://github.com/akfamily/akshare/blob/main/LICENSE) for details.

---

<div align="center">

**AKShare** | * democratizing access to China's financial markets*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz) • [Issues](https://github.com/akfamily/akshare/issues)

</div>
