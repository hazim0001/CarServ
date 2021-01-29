class Customer < ApplicationRecord
  has_many :jobs

  validates :name, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { maximum: 11 }
  validates :license_number, numericality: { only_integer: true }, length: { maximum: 7 }
  validates :age, numericality: { only_integer: true }
end
