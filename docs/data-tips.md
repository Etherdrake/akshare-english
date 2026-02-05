# AKShare Data Usage Tips

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/data_tips.html)*

---

## Data Usage Guidelines

This section provides important tips for using AKShare data effectively.

---

## 1. Data Format

### Data Types

| Type | Description |
|------|-------------|
| `object` | String/text data |
| `int64` | Integer numbers |
| `float64` | Decimal numbers |
| `datetime64` | Date/time data |
| `bool` | True/False values |

### Common Issues

```python
# Check data types
print(df.dtypes)

# Convert types
df['date'] = pd.to_datetime(df['date'])
df['close'] = pd.to_numeric(df['close'])
```

---

## 2. Data Cleaning

### Handling Missing Values

```python
# Check for missing values
print(df.isnull().sum())

# Remove rows with missing values
df_clean = df.dropna()

# Fill missing values
df_filled = df.fillna(method='ffill')  # Forward fill
df_filled = df.fillna(0)  # Fill with 0
```

### Removing Duplicates

```python
# Check for duplicates
print(df.duplicated().sum())

# Remove duplicates
df_clean = df.drop_duplicates()
```

---

## 3. Data Transformation

### Renaming Columns

```python
# Rename columns
df = df.rename(columns={
    'date': 'Date',
    'open': 'Open',
    'close': 'Close'
})
```

### Setting Index

```python
# Set date as index
df = df.set_index('date')

# Reset index
df = df.reset_index()
```

### Sorting Data

```python
# Sort by date
df = df.sort_values('date')

# Sort descending
df = df.sort_values('date', ascending=False)
```

---

## 4. Data Aggregation

### Group By

```python
# Group by month
df['month'] = df['date'].dt.month
monthly = df.groupby('month').agg({
    'open': 'mean',
    'close': 'mean',
    'volume': 'sum'
})
```

### Resample

```python
# Resample to weekly
weekly = df.resample('W').agg({
    'open': 'first',
    'high': 'max',
    'low': 'min',
    'close': 'last',
    'volume': 'sum'
})
```

---

## 5. Data Export

### CSV

```python
df.to_csv('data.csv', index=False)
```

### Excel

```python
df.to_excel('data.xlsx', index=False)
```

### JSON

```python
df.to_json('data.json', orient='records')
```

### SQL

```python
import sqlite3

conn = sqlite3.connect('data.db')
df.to_sql('stocks', conn, if_exists='replace')
```

---

## 6. Performance Tips

### Efficient Data Loading

```python
# Use specific date ranges
df = ak.stock_zh_a_daily(
    symbol="600519",
    start_date="2024-01-01",
    end_date="2024-01-31"
)

# Instead of loading all history
df = ak.stock_zh_a_daily(symbol="600519")  # Loads all
```

### Chunk Processing

```python
# Process large datasets in chunks
for chunk in pd.read_csv('large_file.csv', chunksize=10000):
    process(chunk)
```

---

## 7. Error Handling

### Try-Except

```python
try:
    df = ak.stock_zh_a_daily(symbol="600519")
except Exception as e:
    print(f"Error: {e}")
    # Handle error
```

### Retry Logic

```python
import time

def fetch_with_retry(func, max_retries=3):
    for i in range(max_retries):
        try:
            return func()
        except Exception as e:
            if i == max_retries - 1:
                raise e
            time.sleep(2 ** i)  # Exponential backoff
```

---

## 8. Best Practices

### 1. Validate Data

```python
# Check data range
assert df['close'].min() > 0
assert df['volume'].min() >= 0

# Check date range
assert df['date'].min() >= pd.Timestamp('2000-01-01')
```

### 2. Cache Results

```python
from functools import lru_cache

@lru_cache(maxsize=100)
def get_stock_data(symbol, start, end):
    return ak.stock_zh_a_daily(symbol=symbol, start_date=start, end_date=end)
```

### 3. Log Operations

```python
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info(f"Fetching data for {symbol}")
```

---

## 9. Common Pitfalls

### 1. Survivorship Bias

**Issue:** Only analyzing stocks that still exist.

**Solution:** Use historical constituents data.

### 2. Look-Ahead Bias

**Issue:** Using future information.

**Solution:** Ensure calculations only use past data.

### 3. Data Snooping

**Issue:** Overfitting to historical data.

**Solution:** Use out-of-sample testing.

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
