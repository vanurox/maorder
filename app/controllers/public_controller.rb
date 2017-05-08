class PublicController < ApplicationController
layout 'front'
include ApplicationHelper
  before_filter :cart
  before_filter :view
  before_action :set_auth 
 
  def searchProducts
    
    @maincategory = Maincategory.where("is_active='1'")
    category = Category.all
    subcategory = Subcategory.all
    @pro = Product.last(5)

    if params[:id]
      @id = params[:id]
      @sc = Subcategory.find(@id)
      @products = Product.where("subcategory_id=#{@id}").order(product_name: :desc).page(params[:page]).per(9)
    end
    if params.has_key?(:search)
      name = params[:search][:name]
      @products = Product.where("product_name like '%#{name}%'").order(product_name: :desc).page(params[:page]).per(9)
    end
  end
  def category
    if params[:id]
    @maincategory = Maincategory.where("is_active='1' and id= #{params[:id]}")    
    else
    @maincategory = Maincategory.where("is_active='1'") 
    end
    category = Category.all
    subcategory = Subcategory.all
    products = Product.all
  end

  # change password
  
  def change_password
    password_old =  params[:account][:password_old]
   password_1 =  params[:account][:password_1]
   password_2 =  params[:account][:password_2]
   user_id = session[:user_id]
   user = User.changePassword(user_id,password_old)
   if user
     if password_1 == password_2
         if user.update(:password => password_1)
           @msg = "Password Updated successfully"
           render 'account'  
          else
            @msg = "Error while updating password.Please try again later!!"
           render 'account'
          end
     else
       @msg = "Password and Confirm password doesnot match"
        render 'account'
     end
   else
     @msg = "Your Old password was incorrect"
     render 'account'
   end
  end
  def account
  end
  def addUser
      @page_title = "User Details"
     @user = User.new(user_params)
     if @user.password == params[:user][:confirm_password]
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        session[:name] = @user.userdetail  ? @user.userdetail.name : @user.email;
        session[:email] = @user.email
        session[:is_admin] = @user.is_admin
         @user.update_columns(created_by: session[:user_id])
        redirect_to :controller=>'public',:action=>'view'
        else
        @object = @user.errors.full_messages
        render 'register' 
      end
    else
      @msg = "Password and Confirm Password doesnot match"
      render 'register'
    end
  end
   
  def sellercontact
     @id = params[:id]
    @orders = Orderdetail.where("ordermaster_id=#{@id}")
  end

  def info
    if !session[:products].nil?
        session[:products].each do |p,qty|
        id = p 
        if id == params[:id]
          @value = "1"
          break
        end
        end 
    end
      @product = Product.find_by_id(params[:id])
      @category = @product.typee
      @category = @category.capitalize.constantize
      @features = @category.find_by_product_id(@product.id)
      if @features
        keys_blacklist = %W(id product_id user_id created_by updated_by created_at updated_at)
        @feature_showlist = @features.attributes.except(*keys_blacklist)
      end
     
  end

  def addCart
     if params.has_key?(:cart)
      product_id = params[:cart][:product_id]
      qty = params[:cart][:qty]
      hash = {product_id=>qty}
      session[:products] = session[:products] ? session[:products].merge!(hash) : hash
    end
    redirect_to :action=>'cartview'
  end
  def updateCart
    if params[:id]
      if session[:products]
        qty = params[:quantity]
        session[:products][params[:id]] = qty
        updateCartCount
      else
        redirect_to :controller=>"public"
      end
    end
  end

  def billing
    
  end

  def saveOrder
    @om = Ordermaster.new()
    @om.user_id = session[:user_id]
    totalQty = 0
    totalCost = 0
    session[:products].each do |pid,qty|
      totalQty+= qty.to_f
      p = Product.find(pid)
      totalCost+= qty.to_f * p.price.to_f
    end

    @om.total_products = totalQty
    @om.total_cost = totalCost

    @billing = Billing.new()
    @billing.name = params[:billing][:name]
    @billing.email = params[:billing][:email]
    @billing.contact = params[:billing][:contact]
    @billing.country = params[:billing][:country]
    @billing.address = params[:billing][:address]
    @billing.zip = params[:billing][:zip]


    @shipping = Shipping.new()
    @shipping.shipping_name =  (params[:billing][:shipping_name].present? ? params[:billing][:shipping_name] : params[:billing][:name])
    @shipping.shipping_address = (params[:billing][:shipping_address].present? ? params[:billing][:shipping_address] : params[:billing][:address])
    @shipping.shipping_zip = (params[:billing][:shipping_zip].present? ? params[:billing][:shipping_zip] : params[:billing][:zip])
    @shipping.shipping_contact = (params[:billing][:shipping_contact].present? ? params[:billing][:shipping_contact] : params[:billing][:contact])
   

    if @om.save 
      @order_id = @om.id
      @billing.ordermaster_id = @order_id
      @shipping.ordermaster_id = @order_id

      if @billing.save && @shipping.save
      saveOrderDetail
      clearCart
      flash[:alert]="your order successfully placed......"
      redirect_to :controller=>'public',:action=>'sellercontact',:id=>@order_id
      else
      @object = @billing.errors.full_messages
      render 'public/billing'
      end
     else
      @object = @om.errors.full_messages
      render 'public/cartview'
    end
  end
 
  def saveOrderDetail
    
    session[:products].each do |pid,qty|
      @od = Orderdetail.new()
      p = Product.find(pid)
      @od.ordermaster_id = @order_id
      @od.product_id = pid
      @od.cost = p.price
       @od.quantity = qty
      @od.row_total = qty.to_f * p.price.to_f
      @od.save
    end
    return true
  end

  def deleteCart
    if params[:id]
      session[:products].delete(params[:id])
      updateCartCount
      redirect_to :action=>'cartview'
    end 
  end
  def filter
    if params.has_key?(:filter)
      params.each do |key,param|
        # puts key
        param
        # if param == 1
        #   key = param.key
        # end
      end
      @price1 = params[:filter][:price1]
      @price2 = params[:filter][:price2]
      exit!
    end
    
  end
  def myorder
    @order=Ordermaster.where("user_id = #{session[:user_id]}")  
  end
  def wishlist
    
  end
  
   def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

  private

  def user_params
     return params.require(:user).permit(:email,:password ,:is_admin,:is_seller,:is_active,:created_by,:updated_by)
  end

 
end
  