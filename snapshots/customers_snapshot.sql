{% snapshot customers_snapshot %}

{{
    config(
        target_schema='MARTS',
        unique_key='CUSTOMER_ID',
        strategy='timestamp',
        updated_at='UPDATED_AT'
    )
}}

SELECT *
FROM {{ ref('stg_customers') }}

{% endsnapshot %}