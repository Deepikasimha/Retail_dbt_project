SELECT
    O.ORDER_ID,
    O.CUSTOMER_ID,
    O.ORDER_DATE,
    O.ORDER_STATUS,
    I.ORDER_ITEM_ID,
    I.PRODUCT_ID,
    P.PRODUCT_NAME,
    P.CATEGORY,
    I.QUANTITY,
    I.UNIT_PRICE,
    I.ITEM_AMOUNT
FROM {{ ref('stg_orders') }} O
INNER JOIN {{ ref('stg_order_items') }} I
    ON O.ORDER_ID = I.ORDER_ID
INNER JOIN {{ ref('stg_products') }} P
    ON I.PRODUCT_ID = P.PRODUCT_ID