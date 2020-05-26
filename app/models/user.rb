class User < ApplicationRecord
  validates :name, {presence: true, uniqueness: true}
  has_many :histroys
  has_many :products, through: :histroys

end
