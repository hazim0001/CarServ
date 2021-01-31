class InventoryRestock < ApplicationRecord
  belongs_to :part_supplier
  belongs_to :part_inventory

  monetize :price_per_piece_cents
end
