# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

year = Year.create(year: '2020')
month_1 = Month.create(name: 'January', code: 'Jan')
month_2 = Month.create(name: 'February', code: 'Feb')
month_3 = Month.create(name: 'March', code: 'Mar')
country_uk = Country.create(name: 'United Kingdom', "code": 'UK')
country_bd = Country.create(name: 'Bangladesh', "code": 'BD')
disease_1 = Disease.create(name: 'disease 1')
disease_2 = Disease.create(name: 'disease 2')

user_1 = User.create(name: 'John', email: 'x@y.com', status: 'active')
user_2 = User.create(name: 'Mark', email: 'm@y.com', status: 'active')
user_3 = User.create(name: 'Zoho', email: 'z@y.com', status: 'active')

age_1 = Age.create(range: '0 - 10')
age_2 = Age.create(range: '10 - 20')
age_3 = Age.create(range: '20 - 30')

Profile.create(name: 'Johns Profile',
               gender: 'male',
               profile_type: 'patient',
               user_id: user_1.id,
               year_id: year.id,
               month_id: month_1.id,
               age_id: age_1.id,
               country_id: country_uk.id,
               disease_id: disease_1.id)

Profile.create(name: 'Mark Profile',
               gender: 'male',
               profile_type: 'carer',
               user_id: user_2.id,
               year_id: year.id,
               month_id: month_2.id,
               age_id: age_2.id,
               country_id: country_uk.id,
               disease_id: disease_2.id)

Profile.create(name: 'Zoho Profile',
               gender: 'female',
               profile_type: 'patient',
               user_id: user_3.id,
               year_id: year.id,
               month_id: month_3.id,
               age_id: age_3.id,
               country_id: country_bd.id,
               disease_id: disease_1.id)