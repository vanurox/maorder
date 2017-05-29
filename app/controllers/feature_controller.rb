class FeatureController < ApplicationController
include ApplicationHelper
layout 'admin'
before_filter :confirm_login
  before_filter :confirm_admin

  def feature
  	dp
  end

  def show
    dp
    
    @page_title = "Product Features"
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

  def add
    dp
    if session[:is_admin]
      @product = Product.all
    else
      @product = Product.where("user_id = #{session[:user_id]}")
    end
  	
  end
end
