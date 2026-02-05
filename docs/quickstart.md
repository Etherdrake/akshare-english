# AKShare Quick Start Tutorial

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

---

## Getting Started with AKShare

This quick start guide will help you make your first data query within 5 minutes.

---

## Step 1: Install AKShare

```bash
pip install akshare --upgrade
```

For China users:
```bash
pip install akshare --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple
```

---

## Step 2: Verify Installation

```python
import akshare as ak

# Print version and basic info
print(ak.__version__)
print(ak.__author__)
```

---

## Step 3: Your First Query

### Get Real-Time Market Overview

```python
import akshare as ak

# Get A-share market summary
market_summary = ak.stock_market_summary()
print(market_summary)
```

**Output:**
```
        name  change  pct        volume      amount
0     上证指数    12.45    0.35  3,456,789,000  56,789,000,000
1     深证成指   -23.67   -0.28  2,345,678,000  34,567,000,000
...
```

---

### Get Stock Historical Data

```python
import akshare as ak

# Get historical stock data
stock_df = ak.stock_zh_a_hist(
    symbol="000001",  # Ping An Bank
    period="daily",
    start_date="2024-01-01",
    end_date="2024-01-31"
)
print(stock_df.head())
```

**Output:**
```
         日期       开盘     收盘      最高      最低       成交量         成交额
0  2024-01-31  10.25    10.35    10.40    10.15    5,234,567   523,456,789
1  2024-01-30  10.20    10.25    10.30    10.10    4,567,890   456,789,012
...
```

---

### Get Index Data

```python
import akshare as ak

# Get CSI 300 index historical data
index_df = ak.index_zh_a_hist(
    symbol="000300",  # CSI 300
    period="daily",
    start_date="2024-01-01",
    end_date="2024-01-31"
)
print(index_df.head())
```

---

### Get Fundamental Data

```python
import akshare as ak

# Get stock fundamentals
fund_df = ak.stock_fundamental_flow(
    symbol="600519",  # Kweichow Moutai
    period="annual"
)
print(fund_df)
```

---

## Common Data Interfaces

### Market Data

| Function | Description |
|----------|-------------|
| `stock_market_summary()` | Real-time market overview |
| `stock_zh_a_spot_em()` | A-share realtime quotes |
| `stock_zh_a_hist()` | A-share historical data |
| `stock_hk_spot_em()` | HK stocks realtime quotes |

### Index Data

| Function | Description |
|----------|-------------|
| `index_zh_a_hist()` | China A-share index history |
| `index_zh_a_spot()` | China index realtime quotes |
| `index_sse_spot()` | Shanghai index quotes |

### Futures Data

| Function | Description |
|----------|-------------|
| `futures_main_contract()` | Main contract quotes |
| `futures_zh_spot()` | Chinese futures realtime |
| `futures_zh_hist()` | Chinese futures history |

### Forex Data

| Function | Description |
|----------|-------------|
| `fx_spot()` | Forex spot rates |
| `fx_forexpair()` | Forex pair information |

### Crypto Data

| Function | Description |
|----------|-------------|
| `crypto_spot()` | Crypto spot prices |
| `crypto_futures()` | Crypto futures data |

---

## Data Output Formats

AKShare returns data in pandas DataFrame format:

```python
import akshare as ak

# Get data
df = ak.stock_zh_a_hist(symbol="000001", period="daily", start_date="2024-01-01", end_date="2024-01-31")

# Common operations
df.head()          # First 5 rows
df.tail()           # Last 5 rows
df.shape            # Dimensions
df.columns          # Column names
df.describe()       # Statistical summary
df.to_csv("data.csv")    # Save to CSV
df.to_excel("data.xlsx")  # Save to Excel
```

---

## Next Steps

1. **[Installation Guide](installation.md)** - Complete installation instructions
2. **[API Reference](data/index.md)** - Browse all data interfaces
3. **[Data Dictionary](data/index.md)** - Available data types
4. **[Examples](demo.md)** - Strategy examples

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
