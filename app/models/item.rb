class Item < ApplicationRecord
  belongs_to :shop
  belongs_to :category
end
