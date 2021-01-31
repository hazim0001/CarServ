class LinePart < ApplicationRecord
  belongs_to :job
  belongs_to :part_inventory
  monetize :total_price_cents
end
