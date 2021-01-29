class LinePart < ApplicationRecord
  belongs_to :job
  belongs_to :part_inventory
end
