class Item < ApplicationRecord
  belongs_to :shop
  before_destroy :has_references?

  scope :order_by_quantity, -> { order(quantity: :desc).limit(5) }

  def self.order_by_units
    order(quantity: :desc)
  end

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 300 }
  validates :sku, presence: true, uniqueness: true, numericality: { ony_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: true

  has_many :line_items
  has_many :item_categories
  has_many :categories, through: :item_categories
  #accepts_nested_attributes_for :categories

  def category_name=(name)
     self.categories.first = Category.find_or_create_by(name: name)
   end

   def category_name
      self.categories.first ? self.categories.first.name : nil
   end

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category if category
    end
  end

  private

  def has_references?
    unless line_items.empty?
      errors.add(:base, "Line Items Present")
      throw :abort
    end
  end

end
