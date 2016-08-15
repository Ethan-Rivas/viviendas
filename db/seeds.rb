# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@ivey.com', password: 'password', password_confirmation: 'password')
ProgressCheck.create!(name: 'Cimentación', value: 18)
ProgressCheck.create!(name: 'Muros', value: 18)
ProgressCheck.create!(name: 'Losa', value: 16)
ProgressCheck.create!(name: 'Azoteas', value: 5)
ProgressCheck.create!(name: 'Piso', value: 3)
ProgressCheck.create!(name: 'Acabados', value: 18)
ProgressCheck.create!(name: 'Instalación Eléctrica', value: 4)
ProgressCheck.create!(name: 'Puerta', value: 4)
ProgressCheck.create!(name: 'Ventanas', value: 6)
ProgressCheck.create!(name: 'Pintura', value: 8)
