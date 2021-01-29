class InventoryRestock < ApplicationRecord
  belongs_to :part_supplier
  belongs_to :part_inventory
end
