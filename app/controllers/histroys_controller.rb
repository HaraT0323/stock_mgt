class HistroysController < ApplicationController

  def create
    @histroy = Histroy.new(histroy_params)
    @histroy.product_id = params[:product_id]
    @product = Product.find_by(id: params[:product_id])
    Histroy.set_product(params[:product_id])
    if @histroy.save
      # ステータスに応じて在庫数を変更
      if Histroy.change_product_stock(@product, @histroy.number, @histroy.status)
        flash[:notice] = "在庫数を変更しました。"
        redirect_to @product
      end
    else
      render "products/show"
    end
  end

  private
  def histroy_params
    params.require(:histroy).permit(:status, :number, :product_id, :user_id)
  end

  
end
