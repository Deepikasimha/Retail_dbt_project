SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    UPPER(TRIM(ORDER_STATUS)) AS ORDER_STATUS,
    UPDATED_AT
FROM {{ source('retail_raw', 'raw_orders') }}