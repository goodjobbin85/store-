class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items
end
