class Picture < ActiveRecord::Base
  belongs_to :settlement

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image
  do_not_validate_attachment_file_type :image
end
