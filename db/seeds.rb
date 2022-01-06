# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
currencies = [{portfolio_name: "Cryptocurrencies", name: "Etherium"},
         {portfolio_name: "Stocks", name: "AMC"},
         {portfolio_name: "Precious Metals", name: "Silver"},
         {portfolio_name: "401k", name: "Fidelity Investments"},
         {portfolio_name: "Fiat Currency", name: "USD"}]

currencies.each do |currency|
  Currency.create(currency)
end