# AKShare Dependencies

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

---

## Core Dependencies

AKShare requires the following packages:

### Required

| Package | Minimum Version | Description |
|---------|---------------|-------------|
| Python | 3.8+ | Programming language |
| pandas | 1.3.0 | Data manipulation |
| numpy | 1.20.0 | Numerical computing |
| requests | 2.25.0 | HTTP requests |
| lxml | 4.6.0 | XML/HTML parsing |

### Optional

| Package | Feature |
|---------|---------|
| matplotlib | Plotting charts |
| scipy | Scientific computing |
| openpyxl | Excel file support |
| xlsxwriter | Excel file writing |
| tables | HDF5 file support |

---

## Installing with All Dependencies

```bash
pip install akshare[all]
```

---

## Minimal Installation

For basic usage without optional features:

```bash
pip install akshare
```

---

## Environment Requirements

### Operating System

| OS | Support |
|-----|---------|
| Windows 10/11 64-bit | ✅ |
| macOS 10.15+ 64-bit | ✅ |
| macOS M1/M2/M3 | ✅ |
| Linux (Ubuntu 18.04+) 64-bit | ✅ |
| Raspberry Pi 4B 64-bit | ✅ |

### Hardware

- **Memory:** 4GB RAM minimum (8GB recommended)
- **Storage:** 500MB for installation
- **Network:** Internet connection for data fetching

---

## Dependency Tree

```
akshare
├── pandas>=1.3.0
├── numpy>=1.20.0
├── requests>=2.25.0
├── lxml>=4.6.0
├── python-dateutil>=2.8.0
├── tqdm>=4.60.0
└── beautifulsoup4>=4.9.0
```

---

## Python Version Compatibility

| Python Version | Status |
|---------------|--------|
| 3.8 | Supported |
| 3.9 | Supported |
| 3.10 | Supported |
| 3.11 | Recommended |
| 3.12 | Recommended |

---

## Troubleshooting Dependencies

### Package Conflicts

If you encounter dependency conflicts:

```bash
# Create a new virtual environment
python -m venv akshare-env
source akshare-env/bin/activate  # Linux/Mac
# or: akshare-env\Scripts\activate  # Windows

pip install akshare
```

### Missing Optional Dependencies

Install missing optional packages as needed:

```bash
# For Excel export
pip install openpyxl xlsxwriter

# For plotting
pip install matplotlib

# For scientific computing
pip install scipy
```

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
