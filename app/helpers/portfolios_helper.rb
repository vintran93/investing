module PortfoliosHelper
    def display_portfolio(currency)
        currency.portfolio.nil? ? link_to("Add Portfolio", edit_currency_path(currency)) : link_to(currency.portfolio_name, portfolio_path(currency.portfolio))
    end
  
    # Display dropdown of artists, with name if editing through nested
    def portfolio_select(currency, path)
      if currency.portfolio && path == "nested"
        hidden_field_tag "currency[portfolio_id]", currency.portfolio_id
      else
        select_tag "currency[portfolio_id]", options_from_collection_for_select(Portfolio.all, :id, :name)
      end
    end
  
    # Display name if editing through nested
    def display_name(currency, path)
      if currency.portfolio && path == "nested"
        currency.portfolio.name
      end
    end
end