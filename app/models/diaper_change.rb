class DiaperChange < ApplicationRecord
  belongs_to :baby

  validates :type, inclusion: { in: ['wet', 'dirty'] }
end
