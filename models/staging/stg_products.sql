SELECT
    PRODUCT_ID,
    TRIM(PRODUCT_NAME) AS PRODUCT_NAME,
    UPPER(CATEGORY) AS CATEGORY,
    PRICE,
    UPDATED_AT
FROM {{ source('retail_raw', 'raw_products') }}