class PhotoController < ApplicationController
 include ApplicationHelper
	layout 'admin'
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin

  def photo	
    @page_title = "Photo Details" 
    addFeature
  end

  def addPhoto
  @users = User.all
    photo1 = upload(params[:photo][:photo1])
    photo2 = upload(params[:photo][:photo2])
    photo3 = upload(params[:photo][:photo3])
    photo4 = upload(params[:photo][:photo4])
    photo5 = upload(params[:photo][:photo5])
    if photo1 && photo2 && photo3 && photo4 && photo5 
      params[:photo][:photo1]=photo1
      params[:photo][:photo2]=photo2
      params[:photo][:photo3]=photo3
      params[:photo][:photo4]=photo4
      params[:photo][:photo5]=photo5

    @product = Product.all
    @photo = Photo.new(photo_params)
    if @photo.valid?
      @photo.save
      @msg = "Saved successfully"
      render 'photo'
    else
      @object = @photo.errors.full_messages
      render 'photo'
    end
  end
  end


  def edit 
    
    @page_title = "Photo Details"
    editFeature 
    @id = params[:id]
     @photo = Photo.find_by_product_id(params[:id])
    
    if @photo
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>"error_msg" 
  end
  end

  def updatePhoto
  

  photo1 = (params[:photo][:photo1] ? upload(params[:photo][:photo1]) : params[:photo][:photo11] )

  photo2 = (params[:photo][:photo2] ? upload(params[:photo][:photo2]) : params[:photo][:photo22] )

  photo3 = (params[:photo][:photo3] ? upload(params[:photo][:photo3]) : params[:photo][:photo33] )

  photo4 = (params[:photo][:photo4] ? upload(params[:photo][:photo4]) : params[:photo][:photo44] )

  photo5 = (params[:photo][:photo5] ? upload(params[:photo][:photo5]) : params[:photo][:photo55] )

  
    if photo1 && photo2 && photo3 && photo4 && photo5 
      params[:photo][:photo1]=photo1
      params[:photo][:photo2]=photo2
      params[:photo][:photo3]=photo3
      params[:photo][:photo4]=photo4
      params[:photo][:photo5]=photo5
    @product = Product.all
    @photo=Photo.find(params[:id])
    if @photo.valid?
      @photo.update_attributes(photo_params)
      @msg = "Saved successfully"
      redirect_to :action=>'show'
    else
      @object = @photo.errors.full_messages
      render 'photo'
    end 
  end
  end

  def view
    @page_title = "Photo Details" 
    @id = params[:id]
    @photo = Photo.find_by_product_id(@id)
    if @photo 
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>"error_msg" 
    end
  end

  def show
    @page_title = "Photo Details" 
     if session[:is_admin]
      @product = Product.order(product_name: :desc).page params[:page]
    else
      @product = Product.where("user_id = #{session[:user_id]}").order(product_name: :desc).page params[:page]
    end
    if params.has_key?(:search)
      name = params[:search][:name]
      if session[:is_admin]
        @product = Product.where("product_name like '%#{name}%'").order(product_name: :desc).page params[:page]
      else
        @product = Product.where("user_id = #{session[:user_id]} and product_name like '%#{name}%'").order(product_name: :desc).page params[:page]
      end
    end

  end

def photo_params
    return params.require(:photo).permit(:user_id,:product_id,:photo1,:photo2,:photo3,:photo4,:photo5,:created_by,:updated_by)
  end
end
