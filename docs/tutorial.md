# AKShare Tutorial

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/tutorial.html)*

---

## Viewing Data

For detailed function usage, please refer to the [AKShare Documentation](https://akshare.akfamily.xyz/) for example code of each interface.

---

## API Reference

### Exchange Futures Data

| Function | Description |
|----------|-------------|
| `get_cffex_daily()` | CFFEX daily trading data |
| `get_cffex_rank_table()` | CFFEX top 20 member positions |
| `get_czce_daily()` | CZCE daily trading data |
| `get_rank_table_czce()` | CZCE top 20 member positions |
| `get_dce_daily()` | DCE daily trading data |
| `get_gfex_daily()` | GFEX daily trading data |
| `get_ine_daily()` | INE daily trading data |
| `futures_settlement_price_sgx()` | SGX futures settlement |
| `get_dce_rank_table()` | DCE top 20 member positions |
| `get_futures_daily()` | CFFEX basis data |
| `get_rank_sum()` | Futures ranking data |
| `get_rank_sum_daily()` | Daily futures ranking |
| `futures_dce_position_rank()` | DCE position ranking |
| `get_receipt()` | Commodity warehouse receipts |
| `get_roll_yield()` | Roll yield for contracts |
| `get_roll_yield_bar()` | Roll yield time series |
| `get_shfe_daily()` | SHFE daily trading data |
| `get_shfe_rank_table()` | SHFE top 20 member positions |
| `get_shfe_v_wap()` | SHFE volume-weighted average price |
| `futures_spot_price()` | Commodity spot prices |
| `futures_spot_price_previous()` | Historical spot prices |
| `futures_spot_price_daily()` | Daily spot prices |
| `futures_warehouse_receipt_czce()` | CZCE warehouse receipts |
| `futures_shfe_warehouse_receipt()` | SHFE warehouse receipts |
| `futures_warehouse_receipt_dce()` | DCE warehouse receipts |
| `futures_gfex_warehouse_receipt()` | GFEX warehouse receipts |
| `futures_rule()` | Trading calendar |

### Commodity Index Data

| Function | Description |
|----------|-------------|
| `get_qhkc_index()` | Index values |
| `get_qhkc_index_profit_loss()` | Cumulative profit/loss |
| `get_qhkc_index_trend()` | Large capital flow |
| `get_qhkc_fund_bs()` | Net position distribution |
| `get_qhkc_fund_position()` | Total position distribution |
| `get_qhkc_fund_position_change()` | Net position changes |
| `get_qhkc_tool_foreign()` | Foreign exchange ratios |
| `get_qhkc_tool_gdp()` | Regional GDP data |

### Bond Data

| Function | Description |
|----------|-------------|
| `bond_debt_nafmii()` | NAFMII debt instruments |
| `get_bond_market_quote()` | Bond market quotes |
| `get_bond_market_trade()` | Bond market trades |

### Forex Data

| Function | Description |
|----------|-------------|
| `get_fx_spot_quote()` | RMB forex spot quotes |
| `get_fx_swap_quote()` | RMB forex swap quotes |
| `get_fx_pair_quote()` | Currency pair quotes |

### Macro Data

| Function | Description |
|----------|-------------|
| `macro_euro_interest_rate()` | ECB interest rate decisions |
| `macro_cons_gold()` | Gold ETF holdings |
| `macro_cons_silver()` | Silver ETF holdings |
| `macro_cons_opec_month()` | OPEC monthly report |

### Options Data

| Function | Description |
|----------|-------------|
| `option_hist_dce()` | DCE options history |
| `option_hist_czce()` | CZCE options history |
| `option_hist_shfe()` | SHFE options history |
| `option_hist_gfex()` | GFEX options history |
| `option_vol_gfex()` | GFEX implied volatility |
| `option_vol_shfe()` | SHFE implied volatility |
| `option_hist_yearly_czce()` | CZCE yearly options |

### China Stock Data

| Function | Description |
|----------|-------------|
| `stock_zh_a_spot()` | A-share realtime (Sina) |
| `stock_zh_a_spot_em()` | A-share realtime (EM) |
| `stock_sh_a_spot_em()` | Shanghai A-share realtime |
| `stock_sz_a_spot_em()` | Shenzhen A-share realtime |
| `stock_bj_a_spot_em()` | Beijing A-share realtime |
| `stock_new_a_spot_em()` | New A-share realtime |
| `stock_kc_a_spot_em()` | STAR market realtime |
| `stock_zh_b_spot_em()` | B-share realtime |
| `stock_zh_a_daily()` | A-share daily history |
| `stock_zh_a_minute()` | A-share minute data |
| `stock_zh_a_cdr_daily()` | CDR daily history |

### HK Stock Data

| Function | Description |
|----------|-------------|
| `stock_hk_spot()` | HK stock history |
| `stock_hk_daily()` | HK stock realtime |
| `stock_hk_spot_em()` | HK stock realtime (EM) |
| `stock_hk_main_board_spot_em()` | HK main board realtime |

### US Stock Data

| Function | Description |
|----------|-------------|
| `get_us_stock_name()` | US stock codes |
| `stock_us_spot()` | US stock quotes |
| `stock_us_daily()` | US stock history |

### Index Data

| Function | Description |
|----------|-------------|
| `stock_zh_index_daily()` | Index history |
| `stock_zh_index_daily_tx()` | Index history (Tencent) |
| `stock_zh_index_daily_em()` | Index history (EM) |
| `stock_zh_index_spot_sina()` | Index realtime (Sina) |
| `stock_zh_index_spot_em()` | Index realtime (EM) |
| `index_stock_cons()` | Index constituents |

### A+H Share Data

| Function | Description |
|----------|-------------|
| `stock_zh_ah_spot()` | A+H realtime |
| `stock_zh_ah_daily()` | A+H daily history |
| `stock_zh_ah_name()` | A+H stock codes |

### STAR Market Data

| Function | Description |
|----------|-------------|
| `stock_zh_kcb_spot()` | STAR market realtime |
| `stock_zh_kcb_daily()` | STAR market history |

### Futures Data

| Function | Description |
|----------|-------------|
| `futures_zh_spot()` | Domestic futures realtime |
| `futures_zh_realtime()` | Futures realtime by variety |
| `futures_foreign_commodity_realtime()` | Foreign futures realtime |
| `futures_foreign_hist()` | Foreign futures history |
| `futures_foreign_detail()` | Foreign contract details |
| `futures_zh_minute_sina()` | Minute data |
| `futures_main_sina()` | Continuous contracts |

### Options Data

| Function | Description |
|----------|-------------|
| `get_finance_option()` | SSE financial options |
| `option_current_em()` | Options realtime |
| `option_hist_em()` | Options history |

### Crypto Data

| Function | Description |
|----------|-------------|
| `crypto_js_spot()` | Crypto spot prices |

### Regulatory Data

| Function | Description |
|----------|-------------|
| `bank_fjcf_table_detail()` | Banking regulatory penalties |

### Alternative Data

| Function | Description |
|----------|-------------|
| `article_oman_rv()` | O-Man realized volatility |
| `article_rlab_rv()` | Risk-Lab realized volatility |
| `ff_crr()` | FF factor data |
| `weather_daily()` | Daily sunrise/sunset |
| `weather_monthly()` | Monthly sunrise/sunset |
| `air_quality_hebei()` | Hebei air quality |
| `air_quality_hist()` | Air quality history |
| `air_quality_rank()` | Air quality ranking |
| `article_epu_index()` | EPU index |

### Industry Data

| Function | Description |
|----------|-------------|
| `sw_index_third_info()` | Shenwan industry info |
| `sw_index_third_cons()` | Shenwan industry constituents |

### Fund Data

| Function | Description |
|----------|-------------|
| `fortune_rank()` | Fortune 500 ranking |

### AMAC Data

| Function | Description |
|----------|-------------|
| `amac_member_info()` | Fund member info |
| `amac_person_fund_org_list()` | Fund practitioner info |
| `amac_person_bond_org_list()` | Bond practitioner info |
| `amac_manager_info()` | Fund manager info |
| `amac_manager_classify_info()` | Fund manager classification |
| `amac_manager_cancelled_info()` | Cancelled managers |

### FX Market Data

| Function | Description |
|----------|-------------|
| `fx_spot_quote()` | FX spot quotes |
| `fx_swap_quote()` | FX swap quotes |
| `fx_pair_quote()` | Currency pair quotes |

### Energy Data

| Function | Description |
|----------|-------------|
| `energy_carbon_domestic()` | Domestic carbon emissions |
| `energy_carbon_bj()` | Beijing carbon |
| `energy_carbon_sz()` | Shenzhen carbon |
| `energy_carbon_eu()` | EU carbon |
| `energy_carbon_hb()` | Hubei carbon |
| `energy_carbon_gz()` | Guangzhou carbon |
| `spot_goods()` | Commodity spot indices |
| `macro_cnbs()` | China leverage ratio |

### Financial Options

| Function | Description |
|----------|-------------|
| `option_finance_board()` | Financial options |

### Research Data

| Function | Description |
|----------|-------------|
| `stock_jgdy_tj_em()` | Institutional research stats |
| `stock_jgdy_detail_em()` | Institutional research details |

### Corporate Actions

| Function | Description |
|----------|-------------|
| `stock_gpzy_profile_em()` | Pledge overview |
| `stock_gpzy_pledge_ratio_em()` | Pledge ratios |
| `stock_gpzy_pledge_ratio_detail_em()` | Pledge details |
| `stock_sy_profile_em()` | Goodwill overview |
| `stock_sy_yq_em()` | Goodwill impairment |
| `stock_sy_jz_em()` | Goodwill write-down |
| `stock_account_statistics_em()` | Account statistics |

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz)

</div>
