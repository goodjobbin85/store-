class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items

  #scope :order_by_quantity, -> { joins(:items).order(quantity: :desc).limit(5) }
end
