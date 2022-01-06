class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.string :name

      t.timestamps
    end
  end
end

#rails generate migration add_email_to_users email:string