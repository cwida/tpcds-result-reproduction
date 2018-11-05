SELECT 'dbgen_version         ' tbl, COUNT(*) cnt FROM dbgen_version          UNION ALL
SELECT 'income_band           ' tbl, COUNT(*) cnt FROM income_band            UNION ALL
SELECT 'warehouse             ' tbl, COUNT(*) cnt FROM warehouse              UNION ALL
SELECT 'ship_mode             ' tbl, COUNT(*) cnt FROM ship_mode              UNION ALL
SELECT 'reason                ' tbl, COUNT(*) cnt FROM reason                 UNION ALL
SELECT 'call_center           ' tbl, COUNT(*) cnt FROM call_center            UNION ALL
SELECT 'store                 ' tbl, COUNT(*) cnt FROM store                  UNION ALL
SELECT 'web_page              ' tbl, COUNT(*) cnt FROM web_page               UNION ALL
SELECT 'web_site              ' tbl, COUNT(*) cnt FROM web_site               UNION ALL
SELECT 'promotion             ' tbl, COUNT(*) cnt FROM promotion              UNION ALL
SELECT 'household_demographics' tbl, COUNT(*) cnt FROM household_demographics UNION ALL
SELECT 'catalog_page          ' tbl, COUNT(*) cnt FROM catalog_page           UNION ALL
SELECT 'item                  ' tbl, COUNT(*) cnt FROM item                   UNION ALL
SELECT 'time_dim              ' tbl, COUNT(*) cnt FROM time_dim               UNION ALL
SELECT 'customer_address      ' tbl, COUNT(*) cnt FROM customer_address       UNION ALL
SELECT 'web_returns           ' tbl, COUNT(*) cnt FROM web_returns            UNION ALL
SELECT 'date_dim              ' tbl, COUNT(*) cnt FROM date_dim               UNION ALL
SELECT 'customer              ' tbl, COUNT(*) cnt FROM customer               UNION ALL
SELECT 'catalog_returns       ' tbl, COUNT(*) cnt FROM catalog_returns        UNION ALL
SELECT 'store_returns         ' tbl, COUNT(*) cnt FROM store_returns          UNION ALL
SELECT 'customer_demographics ' tbl, COUNT(*) cnt FROM customer_demographics  UNION ALL
SELECT 'web_sales             ' tbl, COUNT(*) cnt FROM web_sales              UNION ALL
SELECT 'inventory             ' tbl, COUNT(*) cnt FROM inventory              UNION ALL
SELECT 'catalog_sales         ' tbl, COUNT(*) cnt FROM catalog_sales          UNION ALL
SELECT 'store_sales           ' tbl, COUNT(*) cnt FROM store_sales ORDER BY tbl;
