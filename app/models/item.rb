class Item < ApplicationRecord
    #The Ruby Model for the Items that are stored in the library database. Forms must be completely filled out in order for the items to be stored in the
    #database.

    # Associate this item with the user who suggested it
    belongs_to :user, optional: true
 
    PENDING = 0.freeze
    APPROVED = 1.freeze
    DENIED = -1.freeze


    validates :title, presence: true, length: { maximum: 1000 }             #title of the item
    validates :author, presence: true, length: { maximum: 50 }              #author of the item
    validates :description, presence: true, length: { maximum: 1000 }       #description of the item
    validates :url, length: { maximum: 1000 }                               #url of the item
    validates :category, presence: true                                     #category of the item
    validates :status, presence: true

    scope :denieds, -> { where(status: Item::DENIED) }
    scope :approveds, -> { where(status: Item::APPROVED) }
    scope :pendings, -> { where(status: Item::PENDING) }


end