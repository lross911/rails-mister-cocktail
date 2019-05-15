require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
result = JSON.parse(open(url).read)

result['drinks'].each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
  puts "#{ drink['strIngredient1']} was created"
end

martini = Cocktail.create(name: "lemon martini")
Cocktail.create(name: "black ice")
Cocktail.create(name: "bahama mama")

Dose.create(description: "lemon and soda", cocktail: martini, ingredient: Ingredient.first )


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
