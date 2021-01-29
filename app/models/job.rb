class Job < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  has_many :line_parts
  has_many :part_inventories, through: :line_parts
  has_many :line_labours
  has_many :labour_jobs, through: :line_labours
  has_many :mechanics, through: :line_labours
end
