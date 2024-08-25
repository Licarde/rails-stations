class Sheet < ApplicationRecord
  has_many :reservation, dependent: :destroy
end
