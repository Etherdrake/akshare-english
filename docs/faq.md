# AKShare Frequently Asked Questions

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

---

## General Questions

### What is AKShare?

AKShare is an open-source Python library that provides comprehensive interfaces to China's financial data ecosystem. It offers access to stocks, futures, options, funds, forex, bonds, indices, and cryptocurrencies.

### Is AKShare free to use?

Yes! AKShare is completely free and open-source under the MIT License.

### What data sources does AKShare use?

AKShare collects data from publicly available sources including:
- China Stock exchanges (SSE, SZSE, BSE)
- Government statistical websites
- Financial data providers
- Corporate disclosures

---

## Installation Questions

### What Python version do I need?

AKShare requires Python 3.8 or higher. We recommend Python 3.11 or 3.12 for best performance.

### Installation failed with timeout error?

This is common in regions with slow PyPI access. Use a China mirror:

```bash
pip install akshare --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### "Permission denied" error on installation?

Use user installation:

```bash
pip install akshare --user
```

Or use a virtual environment.

### Does AKShare work on macOS M1/M2?

Yes! AKShare now supports Apple Silicon natively. Just install normally:

```bash
pip install akshare --upgrade
```

---

## Usage Questions

### No data returned?

Possible causes:
1. **Network issues** - Check your internet connection
2. **Data source down** - The target website may be unavailable
3. **Rate limiting** - Too many requests
4. **Parameter errors** - Check function parameters

### Data format not recognized?

AKShare returns pandas DataFrames. Convert to your preferred format:

```python
df = ak.stock_zh_a_hist(...)

# To CSV
df.to_csv("data.csv")

# To Excel
df.to_excel("data.xlsx")

# To JSON
df.to_json("data.json")
```

### How to handle missing values?

```python
# Check for missing values
df.isnull().sum()

# Remove rows with missing values
df.dropna()

# Fill missing values
df.fillna(0)
```

---

## Data Questions

### How often is data updated?

- **Real-time data:** Updates every few seconds
- **Daily data:** Updated at end of trading day
- **Fundamental data:** Updated quarterly/annually

### Historical data availability?

Most interfaces provide data from 2000 onwards. Some have more limited history.

### Data accuracy?

AKShare validates data through cross-referencing multiple sources. However, always verify critical data with official sources.

---

## Performance Questions

### Slow data retrieval?

1. Use specific date ranges instead of large periods
2. Cache frequently used data
3. Use session reuse

```python
# Good - specific dates
ak.stock_zh_a_hist(symbol="000001", start_date="2024-01-01", end_date="2024-01-31")

# Slower - large range
ak.stock_zh_a_hist(symbol="000001", start_date="2000-01-01", end_date="2024-01-01")
```

### Rate limiting?

AKShare does not impose limits, but respect data sources by not making excessive requests.

---

## Trading Questions

### Does AKShare support live trading?

AKShare focuses on data acquisition. For live trading, see:
- [Live Trading Integration](trade.md)
- [Strategy Examples](demo.md)

---

## Getting Help

### Where to ask questions?

1. **[GitHub Issues](https://github.com/akfamily/akshare/issues)** - Report bugs
2. **[GitHub Discussions](https://github.com/akfamily/akshare/discussions)** - General questions
3. **[AKTools](https://aktools.akfamily.xyz/)** - HTTP API version

### Before Asking

1. Search existing issues
2. Check documentation
3. Provide:
   - Python version
   - AKShare version (`ak.__version__`)
   - Full error message
   - Minimal reproducible example

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
