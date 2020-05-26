class ProductsController < ApplicationController
  def index
    @product = Product.new
    if params[:id]
      @product = Product.find_by(id: params[:id])
    end
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    @histroy = Histroy.new
    @users = User.all.map { |user| [user.name, user.id] }
  end

  def create
    @product = Product.new(product_params)
    @products = Product.all
    if @product.save
      flash[:notice] = "製品を登録しました。"
      redirect_to products_path
    else
      render "index"
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      redirect_to products_path
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    if @product.destroy
      redirect_to products_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :stock, :model_number)
  end
end
