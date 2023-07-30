  CREATE OR REPLACE FORCE EDITIONABLE VIEW "GLOBAL_SEARCH_VIEW" ("DISPLAY_TEXT", "SEARCH_ENTRY", "ENTRY_TARGET") AS 
  SELECT 
        'Store: '|| store_name|| ' ('||store_id||')' AS display_text,
        store_description as search_entry,
        'f?p=&'||'APP_ID.:5:&'||'SESSION.::&'||'DEBUG.:RP,5:P5_STORE_ID,P5_STORE_OWNER_ID:' || store_id || ',' || customer_id AS entry_target
    FROM stores
    UNION ALL
    SELECT 
        'Product: '|| product_name || ' ('||product_id||')' AS display_text,
        product_description as search_entry,
        'f?p=&'||'APP_ID.:18:&'||'SESSION.::&'||'DEBUG.:RP,18:P18_PRODUCT_ID:'||product_id AS entry_target
    FROM product;