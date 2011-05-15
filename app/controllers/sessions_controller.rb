class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

def destroy
    sign_out
   # reset_session
    redirect_to root_path
  end

def create
  user = User.authenticate(params[:session][:name],
                   params[:session][:password])
                             
    if user.nil?
      flash.now[:error] = "Invalid name."
      @title = "Sign in"
       render 'new'
     else
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
     # render 'index'
      
  end
 end
end
