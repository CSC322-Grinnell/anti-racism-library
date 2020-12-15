class AddStatusToReportTable < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :status, :integer, default: Report::PENDING
    change_column_null :reports, :status, false
  end
end
