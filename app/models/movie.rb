class Movie < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :schedule, dependent: :destroy
  has_many :reservation, dependent: :destroy
end