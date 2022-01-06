class CurrenciesController < ApplicationController


    def table
      @currencies = Currency.all
      require 'net/http'
      require 'json'
      @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=3faaac7a-4b4d-44d3-9001-1cb1e966e9ce'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @search_coin = JSON.parse(@response)
    end

    def index
      if user_signed_in?
        if params[:portfolio_id]
          @portfolio = Portfolio.find_by(id: params[:portfolio_id])
          if @portfolio.nil?
            redirect_to portfolios_path, alert: "Portfolio not found"
          else
            @currencies = @portfolio.currencies
          end
        else
          @currencies = Currency.where(user_id: current_user.id)
        end
      else
        redirect_to new_user_session_url, alert: "You must sign in first."
      end

    end
  
    def show
      @currencies = Currency.all
      require 'net/http'
      require 'json'
      @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=3faaac7a-4b4d-44d3-9001-1cb1e966e9ce'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @search_coin = JSON.parse(@response)

      if params[:portfolio_id]
        @portfolio = Portfolio.find_by(id: params[:portfolio_id])
        @currency = @portfolio.currencies.find_by(id: params[:id])
        if @currency.nil?
          redirect_to portfolio_currencies_path(@portfolio), alert: "Currency not found"
        end
      else
        @currency = Currency.find(params[:id])
      end
    end
  
    def new
      if params[:portfolio_id] && Portfolio.empty(params[:portfolio_id])
        redirect_to portfolios_path, alert: "Portfolio not found"
      else
        @currency = Currency.new(portfolio_id: params[:portfolio_id])
      end
    end
  
    def create
        @currency = Currency.new(currency_params)
        @currency.user_id = current_user.id
          if @currency.save
            redirect_to @currency
          else
            render :new
          end
    end
  
    def edit
      if params[:portfolio_id]
        portfolio = Portfolio.find_by(id: params[:artist_id])
        if portfolio.nil?
          redirect_to portfolios_path, alert: "Portfolio not found"
        else
          @currency = portfolio.currencies.find_by(id: params[:id])
          redirect_to portfolio_currencies_path(portfolio), alert: "Currency not found" if @currency.nil?
        end
      else
        @currency = Currency.find(params[:id])
      end
    end
  
    def update
      @currency = Currency.find(params[:id])
  
      @currency.update(currency_params)
  
      if @currency.save
        redirect_to @currency
      else
        render :edit
      end
    end
  
    def destroy
      @currency = Currency.find(params[:id])
      @currency.destroy
      flash[:notice] = "Currency deleted."
      redirect_to currencies_path
    end
  
    private
    

    def currency_params
      params.require(:currency).permit(:name, :portfolio_id, :portfolio_name, :symbol, :price_per, :amount_owned)
    end

end
  
  