class Movie < ApplicationRecord
  validates :name, :is_showing, presence: true
  validates :name, uniqueness: true
end