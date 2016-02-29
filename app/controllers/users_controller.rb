class UsersController < ApplicationController

	before_action :authenticate_user!
	 def new
	 end

	 def generate_report
     @user = User.find(params[:id])
	 end
end
