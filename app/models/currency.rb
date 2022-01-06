class Currency < ApplicationRecord
    belongs_to :user
	belongs_to :portfolio

    def portfolio_name
        self.try(:portfolio).try(:name)
    end
    
    def portfolio_name=(name)
        portfolio = Portfolio.find_or_create_by(name: name)
        self.portfolio = portfolio
    end
end
