class Micropost < ApplicationRecord
  mount_uploader :image, ImageUploader
end
