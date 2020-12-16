class AddReportIdToItemsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :report_id, :integer
  end
end
