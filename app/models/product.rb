class Product < ApplicationRecord
  validates :name, {presence: true, uniqueness: { scope: :model_number }}
  validates :stock, {presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }}
  validates :model_number, presence: true
  has_many :histroys
  has_many :users, through: :histroys
end
