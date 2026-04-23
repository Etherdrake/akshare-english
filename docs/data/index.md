# AKShare API Reference

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

---

## Market Data

### Stocks

| Function | Description |
|----------|-------------|
| `stock_market_summary()` | Real-time A-share market overview |
| `stock_zh_a_spot_em()` | A-share realtime quotes from Eastmoney |
| `stock_zh_a_hist()` | A-share historical OHLCV data |
| `stock_fundamental_flow()` | Stock fundamental data |
| `stock_zh_a_daily()` | A-share daily bar data |
| `stock_hk_spot_em()` | HK stocks realtime quotes |

### Futures

| Function | Description |
|----------|-------------|
| `futures_main_contract()` | Main contract quotes |
| `futures_zh_spot()` | Chinese futures realtime |
| `futures_zh_hist()` | Chinese futures historical |
| `futures_hs300_spot()` | HS300 futures realtime |

### Options

| Function | Description |
|----------|-------------|
| `option_current_em()` | Options realtime from Eastmoney |
| `option_hist_em()` | Options historical data |

### Forex

| Function | Description |
|----------|-------------|
| `fx_spot()` | Forex spot rates |
| `fx_forexpair()` | Forex pair information |
| `fx_currency_billboard()` | Currency billboard data |

### Crypto

| Function | Description |
|----------|-------------|
| `crypto_spot()` | Crypto spot prices |
| `crypto_futures()` | Crypto futures data |
| `crypto_binance_spot()` | Binance spot data |

### Indices

| Function | Description |
|----------|-------------|
| `index_zh_a_hist()` | China A-share index history |
| `index_zh_a_spot()` | China index realtime |
| `index_sse_spot()` | Shanghai index quotes |

---

## Fundamental Data

### Stock Fundamentals

| Function | Description |
|----------|-------------|
| `stock_fina_indicator()` | Financial indicators |
| `stock_fina_mainbz()` | Main business description |
| `stock_fina_audit()` | Audit information |
| `stock_fina_div()` | Dividend information |

### Fund Data

| Function | Description |
|----------|-------------|
| `fund_etf_spot()` | ETF realtime quotes |
| `fund_etf_hist()` | ETF historical data |
| `fund_pay()` | Fund net value |
| `fund_manager()` | Fund manager information |

### Bond Data

| Function | Description |
|----------|-------------|
| `bond_zh_hs_spot()` | China bond realtime |
| `bond_zh_hs_cov_spot()` | Convertible bond quotes |

---

## Data Dictionary

For complete API documentation, see:
- [Stock Data](data/stock.md)
- [Futures Data](data/futures.md)
- [Bond Data](data/bond.md)
- [Option Data](data/option.md)
- [Forex Data](data/fx.md)
- [Crypto Data](data/currency.md)

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
