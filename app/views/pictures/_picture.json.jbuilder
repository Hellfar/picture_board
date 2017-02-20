json.extract! picture, :id, :path, :owner, :customer, :expire, :created_at, :updated_at
json.url picture_url(picture, format: :json)