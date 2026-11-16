SELECT
    ORDER_ITEM_ID,
    ORDER_ID,
    PRODUCT_ID,
    QUANTITY,
    UNIT_PRICE,
    QUANTITY * UNIT_PRICE AS ITEM_AMOUNT
FROM {{ source('retail_raw', 'raw_order_items') }}