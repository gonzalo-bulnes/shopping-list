class ProductsController < ApplicationController

  def add
    @product = Product.find(params[:id])

    @product.update_attribute(:in_shopping_list, true)

    request.env['HTTP_REFERER'] ||= products_url
    redirect_to :back
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'The new product was successfully created.' }
      else
        if @product.name.blank?
          flash[:error] = 'Please give a name to your product.'
        else
          # the product name was not unique
          flash[:error] = 'This product has already been created.'
        end
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    Product.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to products_url }
    end
  end

  def index
  end

  def new
    @product = Product.new
  end
end
