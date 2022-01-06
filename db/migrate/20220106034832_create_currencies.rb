class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :symbol
      t.integer :user_id
      t.decimal :price_per
      t.decimal :amount_owned

      t.timestamps
    end
  end
end
