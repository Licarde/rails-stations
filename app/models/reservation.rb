class Reservation < ApplicationRecord
  #メール
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  belongs_to :schedule
  belongs_to :sheet
  validates :sheet_id, :schedule_id, :name, presence: true
end
