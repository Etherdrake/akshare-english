# AKShare Environment Setup

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/anaconda.html)*

---

## Anaconda Setup Guide

### Step 1: Download Anaconda

1. Visit https://www.anaconda.com/products/distribution
2. Download Anaconda for your operating system
3. Run the installer

### Step 2: Create Virtual Environment

```bash
# Open Anaconda Prompt (Windows) or Terminal (Mac/Linux)

# Create new environment
conda create -n akshare python=3.11

# Activate environment
conda activate akshare

# Verify Python version
python --version
```

### Step 3: Install AKShare

```bash
pip install akshare --upgrade

# For China users
pip install akshare -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### Step 4: Verify Installation

```python
python
>>> import akshare as ak
>>> print(ak.__version__)
>>> print(ak.__author__)
```

---

## Conda Environment Management

### List Environments

```bash
conda env list
```

### Export Environment

```bash
conda env export > environment.yml
```

### Create from File

```bash
conda env create -f environment.yml
```

### Remove Environment

```bash
conda env remove -n akshare
```

---

## Jupyter Notebook Setup

### Install Jupyter

```bash
pip install jupyter notebook
```

### Launch Jupyter

```bash
jupyter notebook
```

### Use with AKShare

```python
# In Jupyter notebook
import akshare as ak

# Get market data
market = ak.stock_market_summary()
display(market)
```

---

## Virtual Environment (venv)

### Create venv

```bash
# Linux/Mac
python -m venv akshare-env
source akshare-env/bin/activate

# Windows
python -m venv akshare-env
akshare-env\Scripts\activate
```

### Install AKShare

```bash
pip install akshare --upgrade
```

---

## Docker Setup

### Pull Image

```bash
docker pull akshare/akshare:latest
```

### Run Container

```bash
docker run -it akshare/akshare:latest python
```

### Build Custom Image

```dockerfile
FROM akshare/akshare:latest

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "main.py"]
```

---

## Common Issues

### 1. Path Issues

```bash
# Add to PATH (Linux/Mac)
export PATH="/path/to/anaconda3/bin:$PATH"

# Windows: Add via System Properties > Environment Variables
```

### 2. Package Conflicts

```bash
# Create fresh environment
conda create -n akshare-clean python=3.11
conda activate akshare-clean
pip install akshare
```

### 3. Slow Installation

```bash
# Use conda-forge channel
conda install -c conda-forge akshare

# Or use faster pip mirror
pip install akshare -i https://pypi.org/simple
```

---

## Production Deployment

### Using Poetry

```bash
# Install poetry
pip install poetry

# Create project
poetry new akshare-project
cd akshare-project

# Add AKShare
poetry add akshare

# Run
poetry run python script.py
```

### Using pipenv

```bash
pip install pipenv

# Create Pipfile
echo '[packages]
akshare = "*"' > Pipfile

# Install
pipenv install

# Run
pipenv run python script.py
```

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
