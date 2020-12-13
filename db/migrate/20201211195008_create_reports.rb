class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
    
      t.string :reason
      t.string :message

      t.timestamps
      
      # a report belongs to an item 
      t.belongs_to :item
      
    end
  end
end
