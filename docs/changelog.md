# AKShare Changelog

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

---

## Version History

### Version 1.18.x

#### Version 1.18.22 (2026-02-04)

**New Features:**
- Added new data interfaces for emerging markets
- Improved error handling for API rate limits
- Enhanced data validation
- Added support for new data sources

**Bug Fixes:**
- Fixed interface exceptions for several stock data APIs
- Resolved encoding issues for Chinese characters
- Corrected calculation errors in technical indicators

**Documentation:**
- Updated installation guide for latest Python versions
- Added new usage examples

---

#### Version 1.18.0 (Earlier)

**Major Updates:**
- Complete overhaul of data cleaning algorithms
- Improved performance for historical data retrieval
- New HTTP API interface via AKTools
- Enhanced cross-validation between data sources

---

### Version 1.17.x

**New Data Sources:**
- Added support for Beijing Stock Exchange
- Enhanced HK stock data coverage
- New cryptocurrency data interfaces

**Improvements:**
- Faster data acquisition
- Better error messages
- More consistent API naming

---

## Upgrading

To upgrade to the latest version:

```bash
pip install akshare --upgrade
```

For China users:
```bash
pip install akshare --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple
```

---

## Deprecation Notices

### Deprecated Interfaces

The following interfaces have been deprecated and will be removed in future versions:

| Old Function | Replacement | Removal Version |
|-------------|-------------|----------------|
| `old_function()` | `new_function()` | 1.19.0 |

### Python Version Support

| Version | Support Status |
|---------|----------------|
| Python 3.8 | Deprecated |
| Python 3.9-3.11 | Supported |
| Python 3.12+ | Recommended |

---

## Migration Guides

### Upgrading from 1.17 to 1.18

1. Check deprecated function warnings
2. Update import statements if needed
3. Test existing code with new version

---

## Full Changelog

For complete changelog, see [GitHub Releases](https://github.com/akfamily/akshare/releases).

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
