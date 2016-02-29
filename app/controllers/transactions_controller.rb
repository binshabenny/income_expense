class TransactionsController < ApplicationController

	def new
    @transaction = Transaction.new
    @transaction.user_id = current_user.id
    # @start_date = params[:param1]
    # @end_date = params[:param2]
      # @transaction = @transactions.where("date =? ",@start_date)
      # @transaction.where(:created_at => (params[:start_date])..(params[:end_date]))
	end

	def index  
  end

  def create
  end

  def show
  end

  def get_date
   # @start_date = params[:text1]
   # @end_date = params[:text2] 
  end

  def generate_report
   @transactions =  current_user.transactions.where ({:date => params[:start_date].to_date..params[:end_date].to_date})
  end

end
