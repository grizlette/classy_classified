class Category < ActiveRecord::Base
  has_many :items
  validates_presence_of :category_name, :sub_category
end
