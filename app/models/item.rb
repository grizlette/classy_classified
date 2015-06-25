class Item < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :item_name
end
