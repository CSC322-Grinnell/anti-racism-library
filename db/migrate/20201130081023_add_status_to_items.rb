class AddStatusToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :status, :integer, default: Item::PENDING
    change_column_null :items, :status, false
  end
end
