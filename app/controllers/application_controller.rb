  class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   helper_method :current_user
   skip_before_action :verify_authenticity_token
  def confirm_login
      if session[:email] 
        return true
      else
        redirect_to :controller=>'public',:action=>'view'
        return false
      end
end
def confirm_admin
  if session[:is_admin] || session[:is_seller]
    return true
  else
    redirect_to :controller=>'public',:action=>'view'
        return false
  end
end
def logout
    session[:email] = nil
    session[:name] = nil
    session[:id] = nil
    session[:user_id] = nil
    
    session[:products] = nil
    session[:cart_size] = nil
    session[:omniauth] = nil
    redirect_to :controller=>'public',:action=>'view'
  end
  def dp
       if session[:email] 
      @uid= session[:user_id]
      @details =Userdetail.find_by_user_id(@uid)
    else
      redirect_to :controller=>'public',:action=>'view'
      end
  end
  def clearCart
    session[:products]=nil
    session[:cart_size]=nil
  end


  def user_params
     return params.require(:user).permit(:email,:password ,:is_admin,:is_seller,:is_active,:created_by,:updated_by)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

 

end
