# AKShare Technical Indicators

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/indicator.html)*

---

## Technical Indicators

AKShare provides various technical indicators for financial analysis.

---

## Moving Averages

### Simple Moving Average (SMA)

```python
import akshare as ak
import pandas as pd

def calculate_sma(df, window=20):
    """Calculate Simple Moving Average."""
    return df['close'].rolling(window=window).mean()

# Example
df = ak.stock_zh_a_daily(symbol="600519")
df['SMA20'] = calculate_sma(df, 20)
print(df[['date', 'close', 'SMA20']].tail())
```

### Exponential Moving Average (EMA)

```python
def calculate_ema(df, span=20):
    """Calculate Exponential Moving Average."""
    return df['close'].ewm(span=span, adjust=False).mean()

df['EMA20'] = calculate_ema(df, 20)
```

### Weighted Moving Average (WMA)

```python
def calculate_wma(df, window=20):
    """Calculate Weighted Moving Average."""
    weights = pd.Series(range(1, window + 1))
    return df['close'].rolling(window).apply(lambda prices: pd.Series(prices).dot(weights) / weights.sum(), raw=True)

df['WMA20'] = calculate_wma(df, 20)
```

---

## Momentum Indicators

### RSI (Relative Strength Index)

```python
def calculate_rsi(df, period=14):
    """Calculate RSI."""
    delta = df['close'].diff()
    gain = (delta.where(delta > 0, 0)).rolling(window=period).mean()
    loss = (-delta.where(delta < 0, 0)).rolling(window=period).mean()
    rs = gain / loss
    return 100 - (100 / (1 + rs))

df['RSI'] = calculate_rsi(df)
```

### MACD (Moving Average Convergence Divergence)

```python
def calculate_macd(df, fast=12, slow=26, signal=9):
    """Calculate MACD."""
    ema_fast = df['close'].ewm(span=fast, adjust=False).mean()
    ema_slow = df['close'].ewm(span=slow, adjust=False).mean()
    macd = ema_fast - ema_slow
    signal_line = macd.ewm(span=signal, adjust=False).mean()
    histogram = macd - signal_line
    return macd, signal_line, histogram

df['MACD'], df['Signal'], df['Histogram'] = calculate_macd(df)
```

---

## Volatility Indicators

### Bollinger Bands

```python
def calculate_bollinger_bands(df, window=20, std_dev=2):
    """Calculate Bollinger Bands."""
    middle = df['close'].rolling(window=window).mean()
    std = df['close'].rolling(window=window).std()
    upper = middle + (std_dev * std)
    lower = middle - (std_dev * std)
    return upper, middle, lower

df['Upper'], df['Middle'], df['Lower'] = calculate_bollinger_bands(df)
```

### ATR (Average True Range)

```python
def calculate_atr(df, period=14):
    """Calculate ATR."""
    high_low = df['high'] - df['low']
    high_close = abs(df['high'] - df['close'].shift())
    low_close = abs(df['low'] - df['close'].shift())
    tr = pd.concat([high_low, high_close, low_close], axis=1).max(axis=1)
    return tr.rolling(window=period).mean()

df['ATR'] = calculate_atr(df)
```

---

## Trend Indicators

### ADX (Average Directional Index)

```python
def calculate_adx(df, period=14):
    """Calculate ADX."""
    # Calculate +DI and -DI
    high_diff = df['high'].diff()
    low_diff = -df['low'].diff()
    
    plus_di = 100 * (high_diff.rolling(window=period).mean() / df['close'].rolling(window=period).mean())
    minus_di = 100 * (low_diff.rolling(window=period).mean() / df['close'].rolling(window=period).mean())
    
    # Calculate ADX
    dx = abs(plus_di - minus_di) / (plus_di + minus_di)
    adx = dx.rolling(window=period).mean() * 100
    
    return plus_di, minus_di, adx

df['Plus_DI'], df['Minus_DI'], df['ADX'] = calculate_adx(df)
```

### Parabolic SAR

```python
def calculate_psar(df, af=0.02, max_af=0.2):
    """Calculate Parabolic SAR."""
    # Implementation requires iterative calculation
    # This is a simplified version
    return None  # Requires more complex implementation
```

---

## Volume Indicators

### OBV (On-Balance Volume)

```python
def calculate_obv(df):
    """Calculate On-Balance Volume."""
    obv = [0]
    for i in range(1, len(df)):
        if df['close'].iloc[i] > df['close'].iloc[i-1]:
            obv.append(obv[-1] + df['volume'].iloc[i])
        elif df['close'].iloc[i] < df['close'].iloc[i-1]:
            obv.append(obv[-1] - df['volume'].iloc[i])
        else:
            obv.append(obv[-1])
    return obv

df['OBV'] = calculate_obv(df)
```

### VWAP (Volume Weighted Average Price)

```python
def calculate_vwap(df):
    """Calculate VWAP."""
    return (df['close'] * df['volume']).cumsum() / df['volume'].cumsum()

df['VWAP'] = calculate_vwap(df)
```

---

## Complete Example

```python
import akshare as ak
import pandas as pd
import matplotlib.pyplot as plt

# Get data
df = ak.stock_zh_a_daily(symbol="600519", start_date="2024-01-01")

# Calculate indicators
df['SMA20'] = df['close'].rolling(20).mean()
df['SMA60'] = df['close'].rolling(60).mean()
df['RSI'] = calculate_rsi(df)
df['MACD'], df['Signal'], df['Histogram'] = calculate_macd(df)

# Plot
fig, axes = plt.subplots(4, 1, figsize=(12, 16))

# Price with SMA
axes[0].plot(df['date'], df['close'], label='Close')
axes[0].plot(df['date'], df['SMA20'], label='SMA20')
axes[0].plot(df['date'], df['SMA60'], label='SMA60')
axes[0].legend()

# RSI
axes[1].plot(df['date'], df['RSI'], label='RSI')
axes[1].axhline(y=70, color='r', linestyle='--')
axes[1].axhline(y=30, color='g', linestyle='--')

# MACD
axes[2].plot(df['date'], df['MACD'], label='MACD')
axes[2].plot(df['date'], df['Signal'], label='Signal')

# Volume
axes[3].bar(df['date'], df['volume'])

plt.tight_layout()
plt.show()
```

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
