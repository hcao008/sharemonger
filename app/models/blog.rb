class Blog < ApplicationRecord
  has_many :comments
  mount_uploader :picture, BlogPictureUploader

  def self.search(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("title LIKE ?", "%#{search}%")
end

end
