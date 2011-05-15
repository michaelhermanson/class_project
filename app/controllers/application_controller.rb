class ApplicationController < ActionController::Base
  include SessionsHelper
  helper :all
 protect_from_forgery # :secret => 'de30b92a0dfd2a772c000dee4ea91d09'

  def login
    session[:user_id] = nil
    if request.post?
     @user = User.authenticate(params[:name], params[:password])
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
      else
        flash[:login_notice] = "Invalid name/password combination"
      end
      redirect_to params[:url]
    else
      redirect_to '/users'
    end
  end

  def logout
    session[:user_id] = nil
    session[:name] = nil
    #
redirect_to :action => "Sign in"
#    redirect_to 'sessions#new'
  end

  helper_method :find_user
  def find_user(id)
    User.find(:first, :conditions => [ "id = ?", id ])
  end

  helper_method :current_user
  def current_user
    @current_user ||= (session[:user_id] ? find_user(session[:user_id]) : nil)
  end

  helper_method :same_user?
  def same_user?(user)
    logged_user = current_user
  #  return true if logged_user.id == user.id
   return true if logged_user && logged_user.id == user.id
  #  return true if  session[:user_id] == user.id
     else
       false
  end
end

