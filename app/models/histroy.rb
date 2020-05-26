class Histroy < ApplicationRecord
  
  def self.set_product(id)
    $product = Product.find_by(id: id)
  end

  def self.change_product_stock(product, number, status)
    if status == '入庫'
      product.stock += number
    else
      product.stock -= number
    end
    product.save
  end
  
  validates :status, presence: true
  validates :number, {presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 ,less_than_or_equal_to: $product.stock}}
  belongs_to :user
  belongs_to :product
end
