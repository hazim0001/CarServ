class Customer < ApplicationRecord
  has_many :jobs
  has_many :line_parts, through: :jobs
  has_many :line_labours, through: :jobs
  has_many :users, through: :jobs

  validates :name, presence: true
  # validates :phone_number, presence: true, numericality: { only_integer: true }, length: { maximum: 11 }
  # validates :license_number, numericality: { only_integer: true }, length: { maximum: 7 }
  validates :age, numericality: { only_integer: true }
end
