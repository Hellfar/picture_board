class Offer < ApplicationRecord
  # searchkick

  belongs_to :user

  mount_uploader :path, PictureUploader
end
