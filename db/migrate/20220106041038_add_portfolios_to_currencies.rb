class AddPortfoliosToCurrencies < ActiveRecord::Migration[6.1]
  def change
    add_reference :currencies, :portfolio, index: true, foreign_key: true
  end
end
