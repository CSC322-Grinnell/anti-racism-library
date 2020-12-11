class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :reason
      t.string :message

      t.timestamps
      
      # a report belongs to an item 
      t.belongs_to :item
      # a report has item_id to auto populate report form
      # this line connects databases
      t.string :item_id
      
    end
  end
end
