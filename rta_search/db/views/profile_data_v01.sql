WITH
ages AS (
SELECT DISTINCT(id),
range from ages
),

countries AS (
SELECT DISTINCT(id),
name AS country_name,
code as country_code
from countries
),

diseases AS (
SELECT DISTINCT(id),
name AS disease_name
from diseases
),

years AS (
SELECT DISTINCT(id),
year
from years
),

months AS (
SELECT DISTINCT(id),
name AS month_name,
code AS month_code
from months
),

users as (
SELECT DISTINCT(id),
name AS user_name,
email,
status,
deleted_at,
suspended_at
from users
)

SELECT
profiles.id AS id,
MAX(users.user_name) AS user_name,
MAX(users.email) AS email,
CASE WHEN (MAX(users.status) = 0) then 'active' else CASE WHEN (MAX(users.status) = 1) then 'suspended' else 'deleted' end end as status,
MAX(users.deleted_at) AS user_deleted_at,
MAX(users.suspended_at) AS user_suspended_at,
CASE WHEN (profiles.gender > 0) then 'female' else 'male' end as gender,
CASE WHEN (profiles.profile_type > 0) then 'carer' else 'patient' end as profile_type,
MAX(ages.range) AS age_range,
MAX(countries.country_name) AS country_name,
MAX(countries.country_code) AS country_code,
MAX(diseases.disease_name) AS disease_name,
MAX(years.year) AS year,
MAX(months.month_name) AS month_name,
MAX(months.month_code) AS month_code,
MAX(profiles.created_at) AS profile_created_at,
MAX(profiles.updated_at) AS profile_updated_at

FROM profiles
LEFT OUTER JOIN ages ON ages.id = profiles.age_id
LEFT OUTER JOIN countries ON countries.id = profiles.country_id
LEFT OUTER JOIN diseases ON diseases.id = profiles.disease_id
LEFT OUTER JOIN months ON months.id = profiles.month_id
LEFT OUTER JOIN users ON users.id = profiles.user_id
LEFT OUTER JOIN years ON years.id = profiles.year_id

GROUP BY profiles.id
ORDER BY profiles.id

