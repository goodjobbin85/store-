class Item < ApplicationRecord
  belongs_to :shop

  has_many :item_categories
  has_many :categories, through: :item_categories
  #accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category if !self.categories.include?(category)
    end
  end


end
