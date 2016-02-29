class ExpenseCategoriesController < ApplicationController

 def show
 end

 def new
 @expense_category = ExpenseCategory.new
 end

 def index
  @expense_categories = ExpenseCategory.all
 end

 def edit
  @expense_category = ExpenseCategory.find(params[:id])
 end

 def update
  @expense_category = ExpenseCategory.find(params[:id])
 
    if @expense_category.update(expense_category_params)
      redirect_to expense_categories_path
    else
      render 'edit'
    end
 end

 def destroy
    @expense_category = ExpenseCategory.find(params[:id])
    @expense_category.destroy
 
    redirect_to expense_categories_path
  end
  
  def create 
   @expense_category = ExpenseCategory.new(expense_category_params)
   @expense_category.user_id = current_user.id
     if @expense_category.save
       flash[:success] = "New Expense category Is added!"
       redirect_to @expense_category
     end
  end

  private
    def expense_category_params
      params.require(:expense_category).permit(:expense_source, :desc, :user_id)
    end
end
