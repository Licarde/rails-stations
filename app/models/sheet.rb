class Sheet < ApplicationRecord
  has_one :reservation, dependent: :destroy
end
