# AKShare Docker Deployment

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/akdocker/akdocker.html)*

---

## Docker Deployment

This guide covers deploying AKShare using Docker containers.

---

## Prerequisites

- Docker installed
- Docker Compose (optional)
- 4GB RAM minimum
- 10GB disk space

---

## Installation

### 1. Install Docker

**Ubuntu:**
```bash
sudo apt-get update
sudo apt-get install docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
```

**macOS:**
```bash
brew install --cask docker
```

**Windows:**
Download from https://www.docker.com/products/docker-desktop

### 2. Verify Installation

```bash
docker --version
docker-compose --version
```

---

## Quick Start

### Pull Official Image

```bash
docker pull akshare/akshare:latest
```

### Run Container

```bash
docker run -it --rm akshare/akshare:latest python
```

### Run with Volume

```bash
docker run -it --rm \
  -v $(pwd)/data:/app/data \
  akshare/akshare:latest \
  python script.py
```

---

## Custom Dockerfile

### Create Dockerfile

```dockerfile
FROM akshare/akshare:latest

WORKDIR /app

# Copy requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Install additional packages
RUN pip install jupyterlab

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888"]
```

### Build Image

```bash
docker build -t my-akshare-app .
```

### Run Custom Container

```bash
docker run -it --rm \
  -p 8888:8888 \
  -v $(pwd):/app \
  my-akshare-app
```

---

## Docker Compose

### docker-compose.yml

```yaml
version: '3.8'

services:
  akshare:
    image: akshare/akshare:latest
    volumes:
      - ./data:/app/data
      - ./notebooks:/app/notebooks
    ports:
      - "8888:8888"
    environment:
      - TZ=Asia/Shanghai
    restart: unless-stopped

  # Optional: AKTools HTTP API
  aktools:
    image: akfamily/aktools:latest
    ports:
      - "8000:8000"
    environment:
      - TZ=Asia/Shanghai
    restart: unless-stopped
```

### Start Services

```bash
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

---

## Production Deployment

### 1. Build Production Image

```dockerfile
FROM python:3.11-slim as builder

WORKDIR /build
COPY requirements.txt .
RUN pip wheel --wheel-dir=/build/wheels -r requirements.txt

FROM python:3.11-slim

WORKDIR /app
COPY --from=builder /build/wheels /wheels
RUN pip install --no-cache-dir /wheels/*.whl

COPY . .

EXPOSE 8000
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:main"]
```

### 2. Deploy with Systemd

```ini
[Unit]
Description=AKShare Service
After=docker.service
Requires=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/opt/akshare
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down

[Install]
WantedBy=multi-user.target
```

---

## Monitoring

### Health Check

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' container_name
```

### View Metrics

```bash
# Container stats
docker stats

# Disk usage
docker system df
```

---

## Troubleshooting

### Container Won't Start

```bash
# Check logs
docker-compose logs

# Check resources
docker system df
```

### Out of Memory

```bash
# Increase memory limit
docker run -m 4g ...
```

### Network Issues

```bash
# Check network
docker network ls
docker network inspect bridge
```

---

## Security Best Practices

1. **Use specific tags:** `akshare/akshare:1.18.22` instead of `latest`
2. **Run as non-root:** Create user in Dockerfile
3. **Scan images:** Use `trivy` or `snyk`
4. **Update regularly:** `docker-compose pull && docker-compose up -d`

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
