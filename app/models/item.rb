class Item < ApplicationRecord

  belongs_to :user
  has_one :order

  mount_uploader :picture, ProfilePictureUploader

  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("name LIKE ?", "%#{search}%")
  end
end
