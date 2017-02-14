class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, ProfilePictureUploader

  validates :first_name, :last_name, :street, :state, :suburb, :postcode, :country, presence: true

    geocoded_by :full_street_address
    after_validation :geocode

    def full_street_address
      [street, suburb, state, postcode, country].compact.join(',')
    end
  end
