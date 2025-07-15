class Neighborhood < ApplicationRecord
  has_many :properties, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  
  # RANSACK - Atributos permitidos para busca
  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
  
  # RANSACK - Associações permitidas para busca
  def self.ransackable_associations(auth_object = nil)
    ["properties"]
  end
end