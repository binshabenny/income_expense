class IncomeCategoriesController < ApplicationController
	

 def show
 end

 def new
 	 @income_category = IncomeCategory.new
 end
  
 def create 
    @income_category = IncomeCategory.new(income_category_params)
    @income_category.user_id = current_user.id
     if @income_category.save
     flash[:success] = "New Income category Is added!"
     redirect_to @income_category
     end
 end

 def index
  @income_categories = IncomeCategory.all
 end

 def edit
  @income_category = IncomeCategory.find(params[:id])
 end

 def update
  @income_category = IncomeCategory.find(params[:id])
  if @income_category.update(income_category_params)
    redirect_to income_categories_path
  else
    render 'edit'
  end
 end

 def destroy
  @income_category = IncomeCategory.find(params[:id])
  @income_category.destroy
 
    redirect_to income_categories_path
  end

  private
    def income_category_params
      params.require(:income_category).permit(:income_source, :desc, :user_id)
    end
end
 