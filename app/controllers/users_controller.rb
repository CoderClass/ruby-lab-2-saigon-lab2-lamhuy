class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
		@user = User.new user_params
	  if @user.save
	    flash[:success] = "Account created!"
	    session[:user_id] = @user.id

      # @users = User.all
	    redirect_to users_path # create user, let user in and redirect to /users
	  else
	    flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
	    redirect_to new_user_path
	  end
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
