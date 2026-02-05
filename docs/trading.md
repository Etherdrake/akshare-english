# AKShare Live Trading Guide

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/trade.html)*

---

## Overview

This section covers live trading integration with AKShare. AKShare primarily focuses on data acquisition, but can be integrated with various trading platforms.

---

## Supported Trading Platforms

### 1. EasyTrader (银河证券)

EasyTrader provides automated trading capabilities for Galaxy Securities clients.

**Installation:**
```bash
pip install easytrader
```

**Usage:**
```python
import easytrader

# Connect to trading terminal
user = easytrader.use('galaxy')
user.prepare('config.json')  # Load credentials

# Get positions
positions = user.position
print(positions)

# Buy stocks
user.buy('600519', price=2000, amount=100)

# Sell stocks
user.sell('600519', price=2100, amount=100)

# Cancel orders
user.cancel_order('order_id')
```

---

### 2. AkShare with vn.py

vn.py is a professional trading framework that integrates with AKShare.

**Installation:**
```bash
pip install vnpy
```

**Integration:**
```python
from vnpy.app.cta_strategy import CtaStrategy
from akshare import stock_zh_a_spot_em

class MyStrategy(CtaStrategy):
    def __init__(self, strategy_name, vt_symbols, setting):
        super().__init__(strategy_name, vt_symbols, setting)
        self.symbol = "600519"
    
    def on_bar(self, bar):
        # Get data from AKShare
        df = stock_zh_a_spot_em(self.symbol)
        # Implement strategy logic
        pass
```

---

### 3. RiceQuant Integration

RiceQuant provides quantitative research and live trading capabilities.

**Website:** https://www.ricequant.com

---

## Trading API Examples

### Simple Order Entry

```python
import akshare as ak

# Get real-time quotes before trading
quote = ak.stock_zh_a_spot_em("600519")
print(quote)
```

### Market Data for Strategy

```python
import akshare as ak

# Get historical data for backtesting
df = ak.stock_zh_a_daily(
    symbol="600519",
    start_date="2024-01-01",
    end_date="2024-01-31"
)
print(df.head())
```

### Multiple Symbol Analysis

```python
import akshare as ak

# Get market overview
market = ak.stock_market_summary()
print(market)

# Filter for specific stocks
target_stocks = market[market['change'] > 5]
print(target_stocks)
```

---

## Risk Management

### Position Sizing

```python
def calculate_position(capital, risk_per_trade, stop_loss):
    """Calculate position size based on risk management."""
    risk_amount = capital * risk_per_trade
    position_size = risk_amount / stop_loss
    return position_size
```

### Stop Loss Example

```python
def apply_stop_loss(entry_price, stop_pct):
    """Calculate stop loss price."""
    return entry_price * (1 - stop_pct)
```

---

## Best Practices

1. **Always verify data** before executing trades
2. **Use paper trading** to test strategies first
3. **Implement proper risk management**
4. **Monitor positions** actively
5. **Keep logs** of all trading activity

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
