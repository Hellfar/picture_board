class Offer < ApplicationRecord
  searchkick

  belongs_to :user

  mount_uploader :picture, PictureUploader

  def booked?
    if self.expire
      self.expire > Time.now
    else
      false
    end
  end
end
