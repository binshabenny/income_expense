class IncomeController < ApplicationController

  def new
    @income = Income.new
  end

  def show
   @total_income = current_user.income.sum(:amount)
   # redirect_to url_for(:controller => :expenses, :action => :show, :param1 => :@total_income)
    # redirect_to expense_url(@total_income)
  end


def create
  @income = Income.new(income_params)
  @income.user_id = current_user.id
     if @income.save
       flash[:success] = "New Income Is added!"
       # Transaction.create(:date => @income.date, :amount =>  @income.amount,:user_id =>  @income.user_id,:trans_id =>  @income.id,:trans_type => 'income')
        @income.transactions.create(date:  @income.date,user_id:  current_user.id )
        @total_income = current_user.income.sum(:amount)
        # session[:total_income] = @total_income 
        
       redirect_to @income
     end
  end
 
  private
    def income_params
      params.require(:income).permit(:amount,:date, :user_id, :income_category_id)
    end

end

