# AKShare Project Overview

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).
> The authoritative source for this project is the [AKShare GitHub repository](https://github.com/akfamily/akshare).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/introduction.html)*

---

## Latest Release

This release includes [AKTools](https://github.com/akfamily/aktools) as the HTTP API version of AKShare, breaking through Python language limitations. Welcome to try it out and provide feedback!

Click [AKTools](https://github.com/akfamily/aktools) to view the user guide.

## Risk Disclaimer

[AKShare](https://github.com/akfamily/akshare) open-source financial data interface library collects all data from publicly available data sources and does not involve any personal privacy data or non-public data.

At the same time, the data interfaces and related data provided by this project are for academic research purposes only. Any individual, institution, or organization using the data interfaces and related data of this project should pay attention to commercial risks.

- **Documentation last updated:** 2026-02-04
- **Questions?** Please submit issues at [AKShare Issues](https://github.com/akfamily/akshare/issues)

---

## Citation

If you wish to cite [AKShare](https://github.com/akfamily/akshare/) in your articles or projects, please use the following bibtex format:

```bibtex
@misc{akshare2022,
  author = {Albert King},
  title = {AKShare},
  year = {2022},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/akfamily/akshare}},
}
```

---

## Introduction to AKShare

First, I would like to express special thanks to [FuShare](https://github.com/LowinLi/fushare) and [TuShare](https://github.com/waditu/tushare) for their reference and learning opportunities provided in code and project development!

[AKShare](https://github.com/akfamily/akshare) is a financial data interface library based on Python. The goal is to achieve data acquisition, cleaning, and storage for fundamental data, real-time and historical market data, and derivative data of financial products such as stocks, futures, options, funds, forex, bonds, indexes, and cryptocurrencies. It is primarily designed for academic research purposes.

The characteristic of [AKShare](https://github.com/akfamily/akshare) is that it obtains relatively authoritative original data published by financial data websites. By using original data for cross-validation between data sources, and then reprocessing, scientific conclusions can be drawn.

[AKShare](https://github.com/akfamily/akshare) will subsequently add more data interfaces and derivative indicators based on academic papers and research reports, and provide corresponding calculation codes. Please stay tuned.

---

## Key Features of AKShare

[AKShare](https://github.com/akfamily/akshare) main improvements include:

- **Code Standards:** Syntax follows [PEP8](https://peps.python.org/pep-0008/) specifications, with unified naming conventions for data interfaces
- **Python Support:** Best support for Python 3.12 and above
- **Documentation:** Comprehensive documentation for each data interface with detailed explanations and examples - just copy and paste to download data
- **Maintenance:** Continuous maintenance for interface exceptions caused by target webpage changes
- **Updates:** Continuous updates to financial data interfaces and optimization of source code
- **Interface Documentation:** Complete interface documentation to improve the usability of [AKShare](https://github.com/akfamily/akshare)
- **HTTP API:** For non-Python users, provides HTTP API interface tool [AKTools](https://aktools.akfamily.xyz/)

---

## Original Purpose of AKShare

[AKShare](https://akfamily/akshare) is primarily used for financial research, solving the problem of data acquisition in financial research. The current version is mainly based on Python language, obtaining data by calling relevant data interfaces. The principle is to run Python code locally to collect data from the network in real-time, making it convenient for data analysis.

Since network data collection requires maintaining numerous interfaces, and often requires maintenance and updates due to changes in target webpage formats, users need to frequently update the project to the latest version during use. It is also important to follow documentation updates, as the latest usage methods and interface changes will be updated to the documentation first.

---

## See Also

- [Installation Guide](installation.md) - Set up AKShare
- [Quick Start](tutorial.md) - Get started quickly
- [API Reference](data/index.md) - Complete function documentation
- [Data Dictionary](data/index.md) - Available data interfaces
- [Contributing](contributing.md) - How to contribute

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz) • [Issues](https://github.com/akfamily/akshare/issues)

</div>
