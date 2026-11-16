SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    CITY,
    COUNTRY,
    CREATED_AT,
    CURRENT_TIMESTAMP() AS DBT_UPDATED_AT
FROM {{ ref('stg_customers') }}