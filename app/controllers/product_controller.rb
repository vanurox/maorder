class ProductController < ApplicationController
 include ApplicationHelper
layout 'admin'
before_filter :confirm_login
before_filter :dp
  def product
    @users=User.where("is_seller = '1'")
    @page_title = "Product Details" 
  	@sub = Subcategory.all
  end

  def addProduct
    @sub = Subcategory.all  	
    sid = params[:product][:subcategory_id]
    params[:product][:typee] = Subcategory.find(sid).category.category
  	@product = Product.new(product_params)
    @users=User.where("is_seller = '1'")

  	if @product.valid?
  		@product.save
      @id = @product.id
      @u_id = @product.user_id
      feature = params[:product][:typee]
      feature=feature.squish.downcase.tr(" ","")
  		redirect_to :controller=> "#{feature}",:action =>"#{feature}",:id=>@id,:u_id=>@u_id
  	else
  		@object = @product.errors.full_messages
  		render 'product'
  	end	
  end

  def show
    
    @page_title = "Product Details" 
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

  def edit 
    @users=User.where("is_seller = '1'")
    @page_title = "Product Details" 
    @sub = Subcategory.all
    if params[:id]
    @product = Product.find(params[:id]) 
  else
    redirect_to :action=>"show"
  end
  end

  def updateProduct
    
    sid = params[:product][:subcategory_id]
    params[:product][:typee] = Subcategory.find(sid).category.category
    @product=Product.find(params[:id])
    if @product.valid?
      @product.update_attributes(product_params)
      redirect_to :action=> 'show'
    else
      @object=@product.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @product = Product.find_by_id(@id)
  #   if @product.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

    def view
    
    @page_title = "Product Details" 
    @id = params[:id]
    @product = Product.find_by_id(@id)
    if @product
      render 'view'
    else
    redirect_to :action=>'show' 
    end
  end
  def product_params
  	return params.require(:product).permit(:user_id,:subcategory_id,:product_name,:product_code,:typee,:price,:brand,:popularity,:created_by,:updated_by)
  end
end
