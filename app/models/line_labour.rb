class LineLabour < ApplicationRecord
  belongs_to :job
  belongs_to :labour_job
  belongs_to :mechanic
end
