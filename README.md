# Module04_Homework

project_id: dataex-486105

dbt target dataset: dbt_dfreire

## Question 3

```sql
select count(*) as total from `dataex-486105.dbt_dfreire.fct_monthly_zone_revenue`;
```

## Question 4

```sql
select pickup_zone from `dataex-486105.dbt_dfreire.fct_monthly_zone_revenue` 
where service_type = 'Green' and revenue_month >= DATE '2020-01-01'
  AND revenue_month < DATE '2020-12-31'
  order by revenue_monthly_total_amount desc limit 1;
```

## Question 5

```sql
select sum(total_monthly_trips) as total from `dataex-486105.dbt_dfreire.fct_monthly_zone_revenue` 
where service_type = 'Green' and revenue_month >= DATE '2019-10-01'
  AND revenue_month < DATE '2019-11-01'
  group by service_type;
```
