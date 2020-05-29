class CreateItemAndCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :items_categories do |t|
      t.belongs_to :item
      t.belongs_to :category
    end
  end
end
