class Feeding < ApplicationRecord
  belongs_to :baby

  validates :feeding_time, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
