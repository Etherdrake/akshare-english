# AKShare Special Notes

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/special.html)*

---

## Important Disclaimers

### 1. Data Usage Disclaimer

AKShare collects data from publicly available sources. The data is provided for **academic research purposes only**.

**Important:**
- AKShare does not guarantee data accuracy or completeness
- Users are responsible for verifying critical data
- Trading decisions should not be based solely on AKShare data
- Always cross-reference with official sources

---

### 2. Risk Warning

**Trading Risks:**
- Past performance does not guarantee future results
- Historical data may not predict future market behavior
- Always implement proper risk management
- Consider consulting financial advisors

**Data Limitations:**
- Some data may have gaps or delays
- Source websites may change without notice
- Data availability varies by market and time period

---

### 3. Legal Notice

**Terms of Use:**
1. AKShare is free and open-source under MIT License
2. Commercial use is permitted with attribution
3. Users must comply with data source terms of service
4. AKShare maintainers are not liable for any damages

---

## Known Limitations

### 1. Data Coverage

| Market | Coverage | Notes |
|--------|----------|-------|
| A-shares | Good | Mainland exchanges |
| HK stocks | Good | Major indices |
| US stocks | Limited | Selected symbols |
| Futures | Good | CFFEX, SHFE, DCE, CZCE |
| Crypto | Basic | Major coins only |

### 2. Real-Time Data

- Most interfaces provide delayed data (15 min)
- True real-time data may require paid subscriptions
- Check individual interface documentation

### 3. Historical Depth

- Some interfaces have limited history
- Data availability varies by source
- Backfill may be incomplete for older periods

---

## Troubleshooting

### Common Errors

#### Error: "Connection refused"

```python
# Check network connection
import requests
requests.get("https://akshare.akfamily.xyz")
```

#### Error: "No data returned"

```python
# Try alternative source
# Check parameters
# Verify symbol is correct
```

#### Error: "Rate limit exceeded"

```python
# Add delays between requests
import time
time.sleep(1)
```

---

## Best Practices

### 1. Data Validation

```python
def validate_data(df):
    """Validate received data."""
    assert not df.empty, "DataFrame is empty"
    assert 'close' in df.columns, "Missing close column"
    assert (df['close'] > 0).all(), "Invalid close prices"
    return True
```

### 2. Fallback Sources

```python
def get_data_with_fallback(symbol):
    """Try multiple sources."""
    try:
        return ak.stock_zh_a_spot_em(symbol)
    except:
        try:
            return ak.stock_zh_a_spot(symbol)
        except:
            return None
```

### 3. Version Checking

```python
import akshare as ak

print(f"AKShare version: {ak.__version__}")
# Update regularly
# pip install --upgrade akshare
```

---

## Frequently Asked Questions

### Q: Is AKShare free?

**A:** Yes, completely free under MIT License.

### Q: Can I use AKShare for commercial purposes?

**A:** Yes, with attribution to the original project.

### Q: How often should I update AKShare?

**A:** Check for updates weekly, update before reporting issues.

### Q: Does AKShare provide trading signals?

**A:** No, AKShare is a data tool, not a trading system.

### Q: Can I contribute to AKShare?

**A:** Yes! See Contributing Guide for details.

---

## Support

### Getting Help

1. **Documentation:** https://akshare.akfamily.xyz
2. **GitHub Issues:** https://github.com/akfamily/akshare/issues
3. **AKTools:** https://aktools.akfamily.xyz

### Reporting Issues

When reporting issues, include:
- Python version
- AKShare version
- Operating system
- Full error message
- Minimal reproducible example

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
