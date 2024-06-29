class Baby < ApplicationRecord
  belongs_to :user
  has_many :feedings
  has_many :diaper_changes
  has_many :diaries
end
