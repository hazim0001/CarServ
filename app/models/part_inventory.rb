class PartInventory < ApplicationRecord
  has_many :inventory_suppliers
  has_many :part_suppliers, through: :inventory_suppliers

  has_many :line_parts
  has_many :jobs, through: :line_parts

  has_many :inventory_restocks

  monetize :price_cents
  monetize :selling_price_cents
end
