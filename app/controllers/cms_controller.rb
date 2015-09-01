class CmsController < ApplicationController

  def submit_delete
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:message] = @product.id.to_s + " delete done"
      redirect_to(:action => 'metrics')
    else
      flash[:message] = @product.id.to_s + " delete failed"
      redirect_to(:action => 'metrics')
    end
  end

  def submit_edit
    @product = Product.find(params[:id])
    @product.name = params[:product][:name]
    @product.price = params[:product][:price]
    @product.details = params[:product][:details]
    @product.picture_url = params[:product][:picture_url]
    if @product.save
      flash[:message] = "#{@product.id.to_s} save done"
      redirect_to(:action => 'metrics')
    else
      flash[:message] = "#{@product.id.to_s} save failed"
      redirect_to(:action => 'edit_product', :id => @product.id)
    end
  end

  def submit_create
    @new_product = Product.new
    @new_product.name = params[:product][:name]
    @new_product.price = params[:product][:price]
    @new_product.details = params[:product][:details]
    @new_product.picture_url = params[:product][:picture_url]

    if @new_product.valid?
      @new_product.save
      flash[:message] = "Product #{@new_product.name} saved"
      redirect_to(:action => "metrics")
    else
      @new_product.errors.messages.each do |x, y|
        flash[:message] = "#{x} #{y} </br>"
        render "create_product"
      end
    end

  end

  def create_product
  end

  def edit_product
    @product = Product.find(params[:id])
    unless @product
      redirect_to(:action => 'metrics')
    end
  end

  def delete_product
    @product = Product.find(params[:id])
    unless @product
      redirect_to(:action => 'metrics')
    end
  end

  def metrics
    @products = Product.all
  end

  def index
    
  end

  def try_login
    @user = AdminUser.find_by_username(params[:user][:username])
    if @user
      if @user.authenticate(params[:user][:password])
        session[:logged_in] = true
        redirect_to(:action => 'metrics')
      else
        flash[:message] = "Wrong password"
        redirect_to(:action => 'index')
      end
    else
      flash[:message] = "Failed to log-in"
      redirect_to(:action => 'index')
    end
  end

  def logout
    flash[:message] = "Logged out"
    session[:logged_in] = nil
    redirect_to(:action => 'index')
  end

end
