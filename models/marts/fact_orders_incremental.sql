{{
    config(
        materialized='incremental',
        unique_key='ORDER_ID',
        incremental_strategy='merge'
    )
}}
WITH ORDER_SUMMARY AS
(
    SELECT
        ORDER_ID,
        CUSTOMER_ID,
        ORDER_DATE,
        ORDER_STATUS,
        SUM(QUANTITY) AS TOTAL_QUANTITY,
        SUM(ITEM_AMOUNT) AS ORDER_AMOUNT
    FROM {{ ref('int_order_items_enriched') }}
    GROUP BY
        ORDER_ID,
        CUSTOMER_ID,
        ORDER_DATE,
        ORDER_STATUS
)
SELECT *
FROM ORDER_SUMMARY
{% if is_incremental() %}
WHERE ORDER_DATE >= (
    SELECT COALESCE(
        MAX(ORDER_DATE),
        '1900-01-01'::DATE
    )
    FROM {{ this }}
)

{% endif %}