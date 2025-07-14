class Property < ApplicationRecord
  belongs_to :neighborhood
  has_many_attached :images
  
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :neighborhood, presence: true
end