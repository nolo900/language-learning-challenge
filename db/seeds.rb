# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

sammy = User.create(email:'sammy@fake.com', first_name: 'Sammy', last_name:'Potatoes')
jim = User.create(email:'jim@fake.com', first_name: 'Jim', last_name:'Carrey')
sally = User.create(email:'sally@fake.com', first_name: 'Sally', last_name:'Fields')

Language.destroy_all

english = Language.create(name:'English')
french = Language.create(name:'French')
italian = Language.create(name:'Italian')

Proficiency.destroy_all

prof1 = Proficiency.create(proficiency_level:1, user: sammy, language:italian)
prof2 = Proficiency.create(proficiency_level:5, user: jim ,  language:italian)
prof3 = Proficiency.create(proficiency_level:6, user: sally, language:italian)
prof4 = Proficiency.create(proficiency_level:8, user: sally, language:english)
