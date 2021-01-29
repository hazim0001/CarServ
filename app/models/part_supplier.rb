class PartSupplier < ApplicationRecord
  has_many :inventory_suppliers
  has_many :part_inventories, through: :inventory_suppliers
  has_many :line_parts, through: :part_inventories
  has_many :jobs, through: :line_parts

  has_many :inventory_restocks
end
