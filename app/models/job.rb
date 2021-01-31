class Job < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  has_many :line_parts
  has_many :part_inventories, through: :line_parts
  has_many :line_labours
  has_many :labour_jobs, through: :line_labours
  has_many :mechanics, through: :line_labours

  validates :car_model, presence: true
  validates :mileage, numericality: { only_integer: true, greater_than: 0 }

  monetize :total_job_cents
end
