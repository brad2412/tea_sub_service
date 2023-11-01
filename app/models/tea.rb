class Tea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, numericality: { greater_than_or_equal_to: 0 }
  validates :brew_time, numericality: { greater_than_or_equal_to: 0 }

  has_many :subscriptions
end
