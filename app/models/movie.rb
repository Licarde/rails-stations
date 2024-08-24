class Movie < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :schedules, dependent: :destroy
end