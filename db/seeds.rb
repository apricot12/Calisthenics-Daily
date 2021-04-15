# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([{ name: 'Competitions', priority: 1 }, { name: 'Equipment', priority: 2 }, { name: 'Routines', priority: 3 }, { name: 'Diet', priority: 4 }], )
