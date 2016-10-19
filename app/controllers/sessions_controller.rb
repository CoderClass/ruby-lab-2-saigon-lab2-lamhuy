class SessionsController < ApplicationController
    def new
    end

    def create
       if @user = User.find_by(email: params[:email])
         if @user.authenticate(params[:password]) # check if password is correct
           redirect_to users_path
         else
           flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
           redirect_to root_path
         end
       else
         flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
         redirect_to root_path
       end
    end
end
