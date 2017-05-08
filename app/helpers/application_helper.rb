module ApplicationHelper
	@@types = ['png' , 'jpeg' , 'jpg' , 'gif','PNG','JPEG','JPG','GIF']
	 def checkImage(type)
	 	return true if @@types.include?(type)
		end

		def upload(file)
    upload_io = file
    # puts upload_io.inspect
    filename = file.original_filename
    type = filename.split('.').last
    if checkImage(type)
      fld = Time.now.to_i
      rd = rand(2**256).to_s(36)[0..7]
      filename= "img#{fld}#{rd}." + type
      File.open(Rails.root.join("public","uploads",filename), "wb")  do |file|
      	file.write(upload_io.read)
       	return filename
    end
      else
      	return false
      end
  end
  def dp
       if session[:email] 
      @uid= session[:user_id]
      @details =Userdetail.find_by_user_id(@uid)
    else
      redirect_to :controller=>'login',:action=>'login'
      end
  end
    def view
    @maincategory = Maincategory.where("is_active='1'")
    category = Category.all
    subcategory = Subcategory.all
    products = Product.all
    @pro = Product.last(5)
  end
   def cart
    @cart =[]
    @qty = {}
    if !session[:products].nil?
        session[:products].each do |p,qty|
        id = p
        @qty.merge!({p => qty})
        @cart << Product.find(id)
        end
     updateCartCount
    end
  end
   def updateCartCount
    session[:cart_size] = session[:products].size
  end
  def clearcart
    session[:cart_size] = nil
    session[:products] = nil
  end

  def addFeature
    @id = params[:id]
    if session[:is_admin] && params[:u_id] && @id
      @users = User.where("id = #{params[:u_id]}")
      @product = Product.where("user_id = #{params[:u_id]} and id = #{@id}")
    elsif session[:is_admin] && @id
      @users = User.all
      @product = Product.where("id = #{@id}")
    else 
      @product = Product.where("user_id = #{session[:user_id]} and id = #{@id}")  
    end
  end
  def editFeature
    @users = User.where("id = #{params[:u_id]}")
      @product = Product.where("user_id = #{params[:u_id]}")
  end
end
