class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :frequency, presence: true

  belongs_to :customer
  belongs_to :tea
end