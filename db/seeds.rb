# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: 'hazim_alsayed@hotmail.com', password: '123456')
# `say User has been created master`


parts_array = %w[OilFilter brakes bumper]
parts_array.each do |part|
  part_inv = PartInventory.create(description: part, price_cents: (1000...89000).to_a.sample, selling_price_cents: (1000...89000).to_a.sample, brand_name: "Bosch", stock_count: (5..10).to_a.sample)
  part_sup = PartSupplier.create(vendor_name: Faker::Name.name, vendor_number: Faker::PhoneNumber.cell_phone, vendor_address: Faker::Address.full_address )
  2.times do
    restock = InventoryRestock.create(part_inventory: part_inv, part_supplier: part_sup, restock_count: 20, price_per_piece_cents: (3000..8000).to_a.sample)
    part_inv.update(stock_count: part_inv.stock_count + restock.restock_count)
  end
end

# `say Parts inevntor and suppliers have been created`

jobs_array = ['change oil', 'change spark plugs', 'change brakes']
jobs_array.each do |job|
  Mechanic.create(name: Faker::Name.name, salary_cents: 100000, national_id_number: Faker::DrivingLicence.uk_driving_licence)
  LabourJob.create(description: job, cost_cents: 30000, expected_time: 30)
end
# `say mechanics and labour jobs have been created`

2.times do
  customer1 = Customer.create!(name: Faker::Name.name, phone_number: Faker::PhoneNumber.cell_phone, occupation: Faker::Job.title, age: (30..45).to_a.sample, license_number: Faker::Invoice.reference)
  puts customer1.name
  # byebug
  Job.create!(user: User.last, customer: customer1, car_model: Faker::Vehicle.make_and_model, mileage: Faker::Vehicle.mileage, problem: "No ignition")
end

`say customer and job have been created`

# counts = %w[first second last]
# counts.each do |count|
  line = LinePart.create(job: Job.first, part_inventory: PartInventory.first, quantity: (1..3).to_a.sample)
  total_price = (line.part_inventory.selling_price_cents * line.quantity)
  line.update(total_price_parts_cents: total_price )
  line_labour = LineLabour.create(job: Job.first, labour_job: LabourJob.first, mechanic: Mechanic.first)
  # byebug
  Job.first.update(total_job_cents: line.job.total_job_cents + total_price + line_labour.labour_job.cost_cents)
# end

`say Your job total has been updated `

`say i am done master thank you`



