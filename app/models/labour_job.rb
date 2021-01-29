class LabourJob < ApplicationRecord
  has_many :line_labours
  has_many :mechanics, through: :line_labours
  has_many :jobs, through: :line_labours
end
