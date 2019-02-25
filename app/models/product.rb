class Product < ApplicationRecord
  validates :title, presence: true,length:{maximum: 100}
  validates :body, presence: true,length:{maximum: 500}
  validates :image, presence: true
  validates :price, presence: true
end
