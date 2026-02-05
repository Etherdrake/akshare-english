# AKShare Quantitative Platform Integration

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/platform.html)*

---

## Platform Integration

AKShare integrates with various quantitative research and trading platforms.

---

## 1. RiceQuant

**Website:** https://www.ricequant.com

RiceQuant provides a cloud-based quantitative research platform with AKShare data integration.

```python
# RiceQuant API
import rqdatac as rq

# Get data
df = rq.get_price("600519", start_date="2024-01-01", end_date="2024-01-31")
```

---

## 2. JoinQuant

**Website:** https://www.joinquant.com

JoinQuant offers quantitative research tools and AKShare data access.

```python
# JoinQuant API
import jqdatasdk as jq

# Authenticate
jq.auth("username", "password")

# Get data
df = jq.get_price("600519", start_date="2024-01-01", end_date="2024-01-31")
```

---

## 3. TuShare

**Website:** https://tushare.pro

TuShare is another Chinese financial data platform.

```python
import tushare as ts

# Initialize
ts.set_token("your_token")
pro = ts.pro_api()

# Get data
df = pro.daily(ts_code="600519.SH", start_date="20240101", end_date="20240131")
```

---

## 4. vn.py Integration

**Website:** https://www.vnpy.com

vn.py is an open-source quantitative trading framework.

```python
from vnpy.app.cta_strategy import CtaStrategy
from vnpy.data.akshare import AkshareData

# Create data feed
datafeed = AkshareData()
```

---

## 5. Backtrader

**Website:** https://www.backtrader.com

Backtrader is a Python library for backtesting and live trading.

```python
import backtrader as bt
import akshare as ak

class AKShareData(bt.feeds.PandasData):
    params = (
        ('datatype', 'stock_zh_a_daily'),
        ('symbol', '600519'),
    )
```

---

## 6. Zipline

**Website:** https://zipline.ml4quant.com

Zipline is an algorithmic trading library.

```python
from zipline.data import akshare_bundle

# Load AKShare data bundle
data = akshare_bundle.bundle()
```

---

## Local Development

### Jupyter Setup

```python
import akshare as ak
import pandas as pd
import matplotlib.pyplot as plt

# Get data
df = ak.stock_zh_a_daily(symbol="600519")

# Visualize
df['close'].plot(title="Stock Price")
plt.show()
```

### VSCode Setup

1. Install Python extension
2. Configure Python interpreter
3. Install AKShare: `pip install akshare`
4. Create Jupyter notebooks

---

## Cloud Deployment

### AWS

```bash
# Launch instance
aws ec2 run-instances \
  --image-id ami-0c02fb55956c7d316 \
  --instance-type t3.medium \
  --key-name your-key \
  --security-group-ids sg-12345678
```

### Google Cloud

```bash
# Create instance
gcloud compute instances create akshare-server \
  --machine-type=e2-medium \
  --image-family=ubuntu-2004-lts
```

### Azure

```powershell
# Create VM
New-AzVM `
  -ResourceGroupName "aksahre-rg" `
  -Name "aksahre-vm" `
  -Image "UbuntuLTS"
```

---

## Docker Deployment

### Development Image

```dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["jupyter", "notebook", "--ip=0.0.0.0"]
```

### Production Image

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

EXPOSE 8000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:main"]
```

---

## Best Practices

1. **Use virtual environments** for dependency isolation
2. **Implement caching** for frequently accessed data
3. **Handle rate limits** gracefully
4. **Log all operations** for debugging
5. **Use type hints** for better code quality
6. **Write unit tests** for critical functions

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
