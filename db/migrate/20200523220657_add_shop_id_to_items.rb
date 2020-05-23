class AddShopIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shop_id, :integer
  end
end
