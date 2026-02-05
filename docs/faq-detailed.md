# AKShare FAQ

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/answer.html)*

---

## Frequently Asked Questions

### 1. Installation Issues

**Q: pip install fails with timeout**
```
A: Use China mirror source:
   pip install akshare -i https://pypi.tuna.tsinghua.edu.cn/simple
```

**Q: "Permission denied" error**
```
A: Use --user flag:
   pip install akshare --user
```

**Q: Python version not supported**
```
A: AKShare requires Python 3.8+. Check version:
   python --version
   Upgrade if needed from python.org
```

---

### 2. Data Retrieval Issues

**Q: No data returned**
```
A: Possible causes:
   - Network connectivity issues
   - Data source temporarily unavailable
   - API rate limiting
   - Incorrect parameters

   Solutions:
   1. Check internet connection
   2. Verify parameters (stock codes, dates)
   3. Wait and retry
   4. Check for error messages
```

**Q: Data format issues**
```
A: AKShare returns pandas DataFrame.
   Convert to other formats:
   
   # To CSV
   df.to_csv("data.csv")
   
   # To Excel
   df.to_excel("data.xlsx")
   
   # To JSON
   df.to_json("data.json")
```

**Q: Historical data not available**
```
A: Different interfaces have different history depths.
   Check documentation for each interface.
   Some data only available from certain dates.
```

---

### 3. Data Quality Questions

**Q: Data accuracy**
```
A: AKShare validates data through cross-referencing
   multiple sources. However, always verify critical
   data with official sources for trading decisions.
```

**Q: Data update frequency**
```
A: - Real-time data: Updates every few seconds
   - Daily data: Updated end of trading day
   - Fundamentals: Quarterly/annually updates
```

**Q: Missing values handling**
```
A: Check for missing:
   df.isnull().sum()
   
   Options:
   df.dropna()           # Remove rows
   df.fillna(0)           # Fill with 0
   df.fillna(method='ffill')  # Forward fill
```

---

### 4. Performance Questions

**Q: Slow data retrieval**
```
A: Optimization tips:
   1. Use specific date ranges
   2. Cache frequently used data
   3. Reuse sessions where possible
   4. Reduce request frequency
```

**Q: Rate limiting**
```
A: While AKShare doesn't impose limits,
   respect data sources by not making
   excessive requests.
```

---

### 5. Usage Questions

**Q: Getting started guide**
```
A: See our Quick Start tutorial:
   docs/quickstart.md
```

**Q: Finding specific data**
```
A: 1. Check API Reference
   2. Search documentation
   3. Check GitHub Issues
   4. Submit new issue
```

**Q: Contributing to AKShare**
```
A: See Contributing Guide:
   docs/contributing.md
```

---

### 6. Troubleshooting

**Q: Connection errors**
```
A: 1. Check network connection
   2. Try alternative data source
   3. Use VPN if in restricted region
   4. Check firewall settings
```

**Q: Memory issues with large datasets**
```
A: 1. Use date ranges instead of full history
   2. Process data in chunks
   3. Increase system memory
   4. Use data sampling
```

**Q: Encoding errors**
```
A: Set Python encoding:
   import sys
   sys.stdout.reconfigure(encoding='utf-8')
```

---

## Getting More Help

### Official Resources

- **GitHub Issues:** https://github.com/akfamily/akshare/issues
- **Documentation:** https://akshare.akfamily.xyz
- **AKTools:** https://aktools.akfamily.xyz

### Before Submitting Issues

1. Search existing issues
2. Check documentation
3. Reproduce with minimal example
4. Include:
   - Python version
   - AKShare version
   - Full error message
   - Operating system

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
