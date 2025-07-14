class Property < ApplicationRecord
  belongs_to :neighborhood
  has_many_attached :images
  
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :neighborhood, presence: true
  validate :featured_limit
  
  scope :featured, -> { where(featured: true) }
  scope :not_featured, -> { where(featured: false) }
  
  def self.featured_count
    featured.count
  end
  
  def self.can_add_featured?
    featured_count < 3
  end
  
  def can_be_featured?
    !featured? && self.class.can_add_featured?
  end
  
  private
  
  def featured_limit
    if featured? && !featured_was && Property.featured_count >= 3
      errors.add(:featured, 'Máximo de 3 imóveis em destaque permitido')
    end
  end
end