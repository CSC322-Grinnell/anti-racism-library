class Item < ApplicationRecord
    #The Ruby Model for the Items that are stored in the library database. Forms must be completely filled out in order for the items to be stored in the
    #database.
    
    validates :title, presence: true, length: { maximum: 1000 }               #title of the item
    validates :author, presence: true, length: { maximum: 50 }              #author of the item
    validates :description, presence: true, length: { maximum: 1000 }       #description of the item
    validates :category, presence: true                                     #category of the item

end
