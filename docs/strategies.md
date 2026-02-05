# AKShare Strategy Examples

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/demo.html)*

---

## Strategy Examples

### 1. Moving Average Crossover

```python
import akshare as ak
import pandas as pd

def moving_average_strategy(symbol, short_window=20, long_window=60):
    """
    Simple moving average crossover strategy.
    
    Args:
        symbol: Stock symbol
        short_window: Short-term MA period
        long_window: Long-term MA period
    """
    # Get historical data
    df = ak.stock_zh_a_daily(
        symbol=symbol,
        start_date="2023-01-01",
        end_date="2024-01-01"
    )
    
    # Calculate moving averages
    df['MA20'] = df['close'].rolling(window=short_window).mean()
    df['MA60'] = df['close'].rolling(window=long_window).mean()
    
    # Generate signals
    df['Signal'] = 0
    df.loc[df['MA20'] > df['MA60'], 'Signal'] = 1
    df.loc[df['MA20'] < df['MA60'], 'Signal'] = -1
    
    return df

# Run strategy
result = moving_average_strategy("600519")
print(result.tail())
```

---

### 2. RSI Strategy

```python
import akshare as ak
import pandas as pd

def rsi_strategy(symbol, period=14, oversold=30, overbought=70):
    """
    RSI-based trading strategy.
    
    Args:
        symbol: Stock symbol
        period: RSI period
        oversold: Oversold threshold
        overbought: Overbought threshold
    """
    # Get data
    df = ak.stock_zh_a_daily(symbol=symbol)
    
    # Calculate RSI
    delta = df['close'].diff()
    gain = (delta.where(delta > 0, 0)).rolling(window=period).mean()
    loss = (-delta.where(delta < 0, 0)).rolling(window=period).mean()
    rs = gain / loss
    df['RSI'] = 100 - (100 / (1 + rs))
    
    # Generate signals
    df['Position'] = 'Hold'
    df.loc[df['RSI'] < oversold, 'Position'] = 'Buy'
    df.loc[df['RSI'] > overbought, 'Position'] = 'Sell'
    
    return df

# Run strategy
result = rsi_strategy("600519")
print(result[['date', 'close', 'RSI', 'Position']].tail())
```

---

### 3. Dual Thrust Strategy

```python
import akshare as ak
import pandas as pd

def dual_thrust_strategy(symbol, n=4):
    """
    Dual Thrust trading strategy.
    """
    # Get data
    df = ak.stock_zh_a_daily(symbol=symbol)
    df = df.sort_values('date').tail(n * 10)
    
    # Calculate parameters
    high = df['high'].max()
    low = df['low'].min()
    close = df['close'].iloc[-1]
    
    # Dual Thrust logic
    range_val = high - low
    
    # Buy/sell thresholds
    buy_trig = close + 0.3 * range_val
    sell_trig = close - 0.3 * range_val
    
    return {
        'symbol': symbol,
        'close': close,
        'buy_trigger': buy_trig,
        'sell_trigger': sell_trig
    }

# Run strategy
result = dual_thrust_strategy("600519")
print(result)
```

---

### 4. Market Cap Strategy

```python
import akshare as ak

def market_cap_strategy():
    """
    Market cap based strategy.
    """
    # Get market summary
    market = ak.stock_market_summary()
    
    # Filter by market cap (if available)
    # This is a conceptual example
    large_cap = market[market['market_cap'] > 100000000000]
    mid_cap = market[(market['market_cap'] > 50000000000) & 
                      (market['market_cap'] <= 100000000000)]
    small_cap = market[market['market_cap'] <= 50000000000]
    
    return {
        'large_cap_count': len(large_cap),
        'mid_cap_count': len(mid_cap),
        'small_cap_count': len(small_cap)
    }

# Run strategy
result = market_cap_strategy()
print(result)
```

---

### 5. MACD Strategy

```python
import akshare as ak
import pandas as pd

def macd_strategy(symbol, fast=12, slow=26, signal=9):
    """
    MACD-based trading strategy.
    """
    # Get data
    df = ak.stock_zh_a_daily(symbol=symbol)
    
    # Calculate EMAs
    df['EMA12'] = df['close'].ewm(span=fast).mean()
    df['EMA26'] = df['close'].ewm(span=slow).mean()
    
    # Calculate MACD
    df['MACD'] = df['EMA12'] - df['EMA26']
    df['Signal'] = df['MACD'].ewm(span=signal).mean()
    df['Histogram'] = df['MACD'] - df['Signal']
    
    # Generate signals
    df['Position'] = 'Hold'
    df.loc[df['MACD'] > df['Signal'], 'Position'] = 'Bullish'
    df.loc[df['MACD'] < df['Signal'], 'Position'] = 'Bearish'
    
    return df

# Run strategy
result = macd_strategy("600519")
print(result[['date', 'close', 'MACD', 'Signal', 'Histogram', 'Position']].tail())
```

---

### 6. Bollinger Bands Strategy

```python
import akshare as ak
import pandas as pd

def bollinger_bands_strategy(symbol, window=20, std_dev=2):
    """
    Bollinger Bands trading strategy.
    """
    # Get data
    df = ak.stock_zh_a_daily(symbol=symbol)
    
    # Calculate bands
    df['MA'] = df['close'].rolling(window=window).mean()
    df['STD'] = df['close'].rolling(window=window).std()
    df['Upper'] = df['MA'] + (std_dev * df['STD'])
    df['Lower'] = df['MA'] - (std_dev * df['STD'])
    
    # Generate signals
    df['Position'] = 'Hold'
    df.loc[df['close'] < df['Lower'], 'Position'] = 'Oversold (Buy)'
    df.loc[df['close'] > df['Upper'], 'Position'] = 'Overbought (Sell)'
    
    return df

# Run strategy
result = bollinger_bands_strategy("600519")
print(result[['date', 'close', 'MA', 'Upper', 'Lower', 'Position']].tail())
```

---

## Backtesting Framework

### Simple Backtest

```python
def backtest(strategy_func, symbol, initial_capital=100000):
    """
    Simple backtesting framework.
    """
    # Run strategy
    df = strategy_func(symbol)
    
    # Initialize
    capital = initial_capital
    position = 0
    
    # Backtest loop
    for i, row in df.iterrows():
        if row['Position'] == 'Buy' and position == 0:
            position = capital / row['close']
            capital = 0
        elif row['Position'] == 'Sell' and position > 0:
            capital = position * row['close']
            position = 0
    
    # Final portfolio value
    final_value = capital + position * df.iloc[-1]['close']
    return final_value
```

---

## Performance Metrics

| Metric | Description |
|--------|-------------|
| **Return** | Total return percentage |
| **Sharpe Ratio** | Risk-adjusted return |
| **Max Drawdown** | Largest peak-to-trough decline |
| **Win Rate** | Percentage of profitable trades |
| **Profit Factor** | Gross profit / gross loss |

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
