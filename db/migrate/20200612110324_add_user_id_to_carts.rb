class AddUserIdToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :user_id, :integer
    add_column :carts, :invoice_number, :integer
  end
end
