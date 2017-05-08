class UserController < ApplicationController
  layout 'admin'
  before_filter :confirm_login
  include ApplicationHelper

skip_before_action :verify_authenticity_token

  def user     
    @page_title = "User Details" 
  end
    def addUser
      
       @page_title = "User Details"

     @user = User.new(user_params)
     if @user.valid?
        @user.save
        @id = @user.id
        @msg = "User Saved Successfully"
        redirect_to :controller=>'userdetail',:action=>'userdetail',:id=>@id
        else
      @object = @user.errors.full_messages
      render 'user' 
  end
  end

    def show
    @page_title = "User Details" 
    @users = User.order(email: :desc).page params[:page]
    end

    def edit
    
    @page_title = "User Details" 
    @user = User.find_by_id(params[:id])
      if @user
        render 'edit'
      else
        redirect_to :action => 'show'
      end
    end

    def update
    
      @user = User.find(params[:id])
      if @user.valid?
        @user.update_attributes(user_params)
        redirect_to :action => 'edit'
      else
        @object = @user.errors.full_messages
        render 'edit'
      end
    end

   
  #   def delete
  #   @id = params[:id]
  #   @user = User.find_by_id(@id)
  #   if @user.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end
 def user_params
     return params.require(:user).permit(:email,:password ,:is_admin,:is_seller,:is_active,:created_by,:updated_by)
  end

    
    
end
