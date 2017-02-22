class Offer < ApplicationRecord
  searchkick

  belongs_to :user

  mount_uploader :picture, PictureUploader

  def booked?
    self.expire > Time.now
  end
end
