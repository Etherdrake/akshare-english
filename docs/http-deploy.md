# AKShare HTTP Deployment

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/deploy_http.html)*

---

## AKTools - HTTP API

[AKTools](https://github.com/akfamily/aktools) provides HTTP API access to AKShare functionality, enabling non-Python applications to use AKShare data.

---

## Installation

### Docker (Recommended)

```bash
# Pull image
docker pull akfamily/aktools:latest

# Run container
docker run -d -p 8000:8000 --name aktools akfamily/aktools:latest
```

### Manual Installation

```bash
# Clone repository
git clone https://github.com/akfamily/aktools.git
cd aktools

# Install dependencies
pip install -r requirements.txt

# Run server
python main.py
```

---

## Usage

### REST Endpoints

#### Get Market Data

```bash
# Request
curl "http://localhost:8000/api/v1/stock/market_summary"

# Response
{
  "code": 200,
  "data": [
    {
      "name": "上证指数",
      "close": 3500.25,
      "change": 12.35,
      "pct": 0.35
    }
  ]
}
```

#### Get Stock Data

```bash
# Request
curl "http://localhost:8000/api/v1/stock/quote?symbol=600519"

# Response
{
  "code": 200,
  "data": {
    "symbol": "600519",
    "name": "贵州茅台",
    "close": 1800.50,
    "open": 1795.00,
    "high": 1810.00,
    "low": 1790.00
  }
}
```

---

## API Reference

### Market Data

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/stock/market_summary` | GET | Market overview |
| `/api/v1/stock/quote` | GET | Real-time quote |
| `/api/v1/stock/history` | GET | Historical data |
| `/api/v1/index/quote` | GET | Index quotes |

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `symbol` | string | Yes | Stock code |
| `start_date` | string | No | Start date (YYYY-MM-DD) |
| `end_date` | string | No | End date (YYYY-MM-DD) |
| `period` | string | No | daily/weekly/monthly |

---

## Configuration

### config.yaml

```yaml
# Server configuration
host: "0.0.0.0"
port: 8000

# Data settings
cache:
  enabled: true
  ttl: 300  # seconds

# Rate limiting
rate_limit:
  enabled: true
  requests_per_minute: 60
```

---

## Docker Deployment

### docker-compose.yml

```yaml
version: '3.8'

services:
  aktools:
    image: akfamily/aktools:latest
    ports:
      - "8000:8000"
    volumes:
      - ./config.yaml:/app/config.yaml
    restart: always
```

### Deploy

```bash
docker-compose up -d
```

---

## Production Deployment

### Using Nginx

```nginx
server {
    listen 80;
    server_name aktools.example.com;

    location / {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Systemd Service

```ini
[Unit]
Description=AKTools Service
After=network.target

[Service]
Type=simple
User=www-data
WorkingDirectory=/opt/aktools
ExecStart=/usr/bin/python main.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

---

## Monitoring

### Health Check

```bash
curl http://localhost:8000/health
```

### Metrics

```bash
# View metrics
curl http://localhost:8000/metrics
```

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz) • [AKTools](https://aktools.akfamily.xyz)

</div>
