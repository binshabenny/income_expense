class ExpensesController < ApplicationController

 def new
  @expense = Expense.new
 end

 def show
  @exp = Income.all
  @total_expense = current_user.expenses.sum(:amount)
  

  # @balance = @total_expense- @total_income
 end


 def create
  @expense = Expense.new(expense_params)
  @expense.user_id = current_user.id
     if @expense.save
       flash[:success] = "New Expense Is added!"
        @expense.transactions.create(date:  @expense.date,user_id:  current_user.id )
        @total_expense = current_user.expenses.sum(:amount)
        # @total_income= Income.find(session[:total_income])
        # @balance =@total_expense - @total_income
       redirect_to @expense
     end
  end

  def get_expense_category
   # @expense = Expense.new
  end

  def expense_report
    expense_category_id = params[:expense][:expense_category_id] 
     @expenses = current_user.expenses.where({:date => params[:start_date].to_date..params[:end_date].to_date, :expense_category_id => expense_category_id}).includes(:expense_category)
  end
  
 
  private
    def expense_params
      params.require(:expense).permit(:amount,:date, :user_id, :expense_category_id)
    end
end
# time_range = (Time.now.midnight - 1.day)..Time.now.midnight
# Client.joins(:orders).where('orders.created_at' => time_range)