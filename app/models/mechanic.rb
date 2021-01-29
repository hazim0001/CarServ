class Mechanic < ApplicationRecord
  has_many :line_labours
  has_many :jobs, through: :line_labours
  has_many :labour_jobs, through: :line_labours
end
