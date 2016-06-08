class Picture < ActiveRecord::Base
  belongs_to :settlement
  has_attached_file :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
