class Item < ApplicationRecord
  belongs_to :shop
  before_destroy :has_references?

  has_many :line_items
  has_many :item_categories
  has_many :categories, through: :item_categories
  #accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  private

  def has_references?

  end 

end
