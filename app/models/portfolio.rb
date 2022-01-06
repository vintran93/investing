class Portfolio < ApplicationRecord
    validates :name, uniqueness: true
    
    has_many :currencies
	has_many :users, through: :currencies
end
