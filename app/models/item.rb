class Item < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :item_name

  has_attached_file :photo, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "150x150>", :exsm => "70x70" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
