class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items

  scope :order_by_units, -> { order(quantity: :desc).limit(5) }
end
