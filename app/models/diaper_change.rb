class DiaperChange < ApplicationRecord
  belongs_to :baby

  validates :change_time, presence: true
  validates :change_type, presence: true, inclusion: { in: ['wet', 'dirty'] }
end
