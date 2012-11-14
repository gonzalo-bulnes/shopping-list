class ProductsController < ApplicationController
  def index
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'The new product was successfully created.' }
      else
        flash[:error] = 'Please give a name to your product.'
        format.html { render action: "new" }
      end
    end
  end
end
