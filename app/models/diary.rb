class Diary < ApplicationRecord
  belongs_to :baby
  mount_uploader :photo, PhotoUploader
end
