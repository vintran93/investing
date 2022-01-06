class PortfoliosController < ApplicationController
end
class PortfoliosController < ApplicationController
    

    def index
      if user_signed_in?
        if params[:portfolio_id]
          @portfolio = Portfolio.find_by(id: params[:portfolio_id])
          if @portfolio.nil?
            redirect_to portfolios_path, alert: "Portfolio not found"
          else
            @portfolios = @portfolio.currencies
          end
        else
          @portfolios = Portfolio.where(user_id: current_user.id)
        end
        else
          redirect_to new_user_session_url, alert: "You must sign in first."
      end
    end
  
    def show
      @portfolio = Portfolio.find(params[:id])
    end
  
    def new
      @portfolio = Portfolio.new
    end
  
    def create
      @portfolio = Portfolio.new(portfolio_params)
      @portfolio.user_id = current_user.id
        if @portfolio.save
          redirect_to @portfolio
        else
          redirect_to portfolios_path, alert: "That portfolio already exists. Please try again."
        end
    end
  
    def edit
      @portfolio = Portfolio.find(params[:id])
    end
  
    def update
      @portfolio = Portfolio.find(params[:id])
  
      @portfolio.update(portfolio_params)
  
      if @portfolio.save
        redirect_to @portfolio
      else
        render :edit
      end
    end
  
    def destroy
      @portfolio = Portfolio.find(params[:id])
      @portfolio.destroy
      flash[:notice] = "Portfolio deleted."
      redirect_to portfolios_path
    end
  
    private
  
    def portfolio_params
      params.require(:portfolio).permit(:name)
    end
end
  