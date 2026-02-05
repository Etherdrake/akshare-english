# AKShare Contributing Guide

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

---

## How to Contribute

AKShare welcomes contributions from the community! Here's how you can help:

---

## Ways to Contribute

### 1. Report Issues

Found a bug or have a feature request?

1. Search existing [issues](https://github.com/akfamily/akshare/issues) to avoid duplicates
2. Create a new issue with:
   - Clear title
   - Detailed description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior

### 2. Submit Pull Requests

Want to fix a bug or add a feature?

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-feature`
3. Make your changes
4. Run tests and linting
5. Submit a pull request

### 3. Improve Documentation

Documentation improvements are always welcome!

---

## Code Standards

### Python Style

Follow [PEP 8](https://peps.python.org/pep-0008/) guidelines:

```python
# Good
def calculate_moving_average(data, window):
    """Calculate moving average for given data."""
    return data.rolling(window=window).mean()

# Avoid
def calculateMA(data,window):  # No spaces, camelCase
    return data.rolling(window).mean()  # Missing docstring
```

### Function Documentation

Every function should have a docstring:

```python
def stock_market_summary():
    """
    Get real-time A-share market summary.
    
    Returns:
        pd.DataFrame: Market data with columns for name, price, change, etc.
    """
    pass
```

---

## Development Setup

### 1. Clone Repository

```bash
git clone https://github.com/akfamily/akshare.git
cd akshare
```

### 2. Create Virtual Environment

```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
# or: venv\Scripts\activate  # Windows
```

### 3. Install Development Dependencies

```bash
pip install -e .
pip install pytest black flake8 mypy
```

### 4. Run Tests

```bash
pytest tests/
```

### 5. Code Formatting

```bash
black akshare/
flake8 akshare/
mypy akshare/
```

---

## Adding New Data Interfaces

### 1. Create Interface Function

```python
def stock_new_data_api(symbol: str, period: str = "daily") -> pd.DataFrame:
    """
    Get new data from API.
    
    Parameters:
        symbol: Stock symbol
        period: Data period (daily, weekly, monthly)
    
    Returns:
        pd.DataFrame: New data table
    """
    # Implementation here
    pass
```

### 2. Add to Module

Add the function to the appropriate module file.

### 3. Write Tests

```python
def test_stock_new_data_api():
    """Test the new data API."""
    df = ak.stock_new_data_api("600519")
    assert not df.empty
```

---

## Adding Documentation

### For New Functions

Add docstring following the existing format.

### For New Modules

Create a new documentation file in the appropriate section.

---

## Code Review Process

1. All pull requests require review
2. Address reviewer comments
3. Maintainers will merge after approval

---

## Recognition

Contributors are acknowledged in:
- Release notes
- GitHub contributors page
- Project documentation

---

## Questions?

For questions about contributing, please open an [issue](https://github.com/akfamily/akshare/issues).

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
