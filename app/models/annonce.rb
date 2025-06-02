class Annonce < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :titre, presence: true
  validates :description, presence: true
  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :categorie, presence: true
  validates :localisation, presence: true
  # Validation d'Active Storage avec la bonne gem
  validates :image, attached: true, 
                    content_type: [:png, :jpg, :jpeg],
                    size: { less_than: 5.megabytes, message: 'doit être inférieur à 5 MB' }

end