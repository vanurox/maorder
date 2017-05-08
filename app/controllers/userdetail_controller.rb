class UserdetailController < ApplicationController
  layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  def userdetail
    dp
    @page_title = "User Details" 
    @users = User.all
  end
    def addUser
      
      if params[:userdetail][:profile_pic]
        photo = upload(params[:userdetail][:profile_pic])
        params[:userdetail][:profile_pic]=photo
      end
       @users=User.all
           @detail = Userdetail.new(user_params)
           if @detail.valid?
             @detail.save
              @msg = "User Saved Successfully"
              redirect_to :action=>'show'
           else
              @object = @detail.errors.full_messages
              render 'userdetail'
           end    
    end

    def show
      dp
      @page_title = "User Details"   
    if session[:is_admin]
    @users = User.all
    else
      @users = User.where("id = #{session[:user_id]}")
    end

    end
    def view
      dp
    @page_title = "User Details" 
    @id = params[:id]
    @userdetail = Userdetail.find_by_user_id(@id)
    if @userdetail
      render 'view'
    else
    redirect_to :action=>'show' 
    end
  end
    def edit
      dp
    @page_title = "User Details" 
    @userdetail = Userdetail.find_by_user_id(params[:id])
    if @userdetail
        render 'edit'
    else
        redirect_to :action => 'show'
      end
    end

    def updateUser
     
      if params[:userdetail][:profile_pic]
        photo = upload(params[:userdetail][:profile_pic])
        params[:userdetail][:profile_pic]=photo
      end
       @userdetail = Userdetail.find(params[:id])
          if @userdetail.valid?
        @userdetail.update_attributes(user_params)
        redirect_to :action => 'show'
      else
        @object = @userdetail.errors.full_messages
        render 'edit'
      end
  end

    def user_params
     return params.require(:userdetail).permit(:user_id,:name ,:number,:profile_pic,:shop_name,:shop_address,:created_by,:updated_by)
    end
end
