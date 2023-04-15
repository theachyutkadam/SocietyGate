# frozen_string_literal: true

@counter = 0

def start_seeding
  society = FactoryBot.create(:society)
  20.times { |num| create_building(num, society) }
end

def create_building(num, society)
  building = FactoryBot.create(:building, name: "R#{num + 1}", society: society)
  puts
  puts "building name - R#{num + 1}"
  5.times do |num|
    create_amenity(building)
    create_wing(num, building)
  end
  create_commity(building)
end

def create_wing(num, building)
  wing = FactoryBot.build(:wing, building: building)
  puts "wing name - #{building.name}/#{wing.name}"
  if wing.valid?
    wing.save
    22.times { |num| create_floor(num + 1, wing, building.society) }
  else
    puts "+++++++#{wing.errors.each { |error| puts error.message }}++++++++"
    create_wing(num, building)
  end
end

def create_floor(floor_num, wing, society)
  puts "floor - #{wing.name}-#{floor_num.ordinalize}"
  floor = FactoryBot.create(:floor, number: floor_num.ordinalize.to_s, wing: wing, number_of_flats: 12)
  12.times { |flat_num| create_flat(flat_num + 1, floor, floor_num, society) }
  puts
end

def create_flat(flat_num, floor, floor_num, society)
  number = "#{floor_num}#{format('%02d', flat_num)}"
  puts "flat #{number} "
  flat = FactoryBot.build(:flat, number: number, floor: floor, owner: create_user(society))
  puts "Add Owner with UI "

  flat.tenant = create_user(society, user_type: "tenant") if flat.is_rented
  flat.save

  if flat.is_rented
    puts "Add Tenant with UI "
    5.times { |number| create_tenant_history(flat, flat.tenant, number) }
  end

  create_parking(flat.wing.building, flat.owner, flat)
  rand(1..4).times { |_num| create_family_member(flat) }
  puts
end

def create_user(society, user_type: "owner")
  user = FactoryBot.build(:user, society: society, user_type: user_type)
  if user.save
    user = User.find_by(email: user.email)
    create_user_information(user)
    create_address(user)
    user
  else
    puts "@@@@@@User error - #{user.errors.each { |error| puts error.message }}@@@@@@"
    create_user(society)
  end
end

def create_user_information(user)
  user_info = FactoryBot.build(:user_information, user: user)
  if user_info.save
    UserInformation.find_by(contact: user_info.contact)
  else
    puts "@@@@@@UserInformation error - #{user_info.errors.each do |error|
                                                          puts error.message
                                                        end}@@@@@@"
    create_user_information(user)
  end
end

def create_tenant_history(flat, tenant, number)
  tenant_user = User.tenant.sample
  move_in_at = Faker::Date.backward(days: 2000)
  move_out_at = Faker::Date.backward(days: 25)
  if number == 4
    tenant_user = tenant
    move_in_at = Date.today
    move_out_at = nil
  end
  puts "tenant history created"
  tenant_history = FactoryBot.build(:tenant_history, flat: flat, tenant: tenant_user, move_in_at: move_in_at,
                                                     move_out_at: move_out_at)
  return tenant_history if tenant_history.save

  create_tenant_history(flat, tenant, number)
end

def create_address(user)
  puts "address created"
  address = FactoryBot.build(:address, user: user)
  return address if address.save

  create_address(user)
end

def create_amenity(building)
  puts "Added amenity"
  amenity = FactoryBot.build(:amenity, building: building)
  if amenity.save
    return amenity
  else
    puts "@@@@@@Amenity error - #{amenity.errors.each { |error| p error.message }}@@@@@@"
    create_amenity(building)
  end

end

def create_parking(building, owner, flat)
  owner = flat.tenant if flat.is_rented
  parking = FactoryBot.build(:parking, number: "#{flat.letter_box_number}", building: building, owner: owner, flat: flat)
  puts "Assign Parking "
  if parking.save
    rand(1..4).times { |_num| create_vehicle(flat, owner) }
    nil
  else
    create_parking(building, owner, flat)
  end
  # create_commitee_member(commity,  owner)
end

def create_vehicle(flat, user)
  puts "Add Vehicle "
  vehicle = FactoryBot.build(:vehicle, flat: flat, user: user)
  return vehicle if vehicle.save

  create_vehicle(flat, user)
end

def create_family_member(flat)
  family_member = FactoryBot.build(:family_member, flat: flat)
  puts "Add Family Member "
  return family_member if family_member.save

  create_family_member(flat)
end

def create_document
  FactoryBot.create(:document)
end

def create_gate_entry
  FactoryBot.create(:gate_entry)
end

def create_complaint
  FactoryBot.create(:complaint)
end

def create_event
  FactoryBot.create(:event)
end

def create_commity(building)
  puts "Add Commity "
  commity = FactoryBot.build(:commity, building: building, title: "#{building.name} Admin")
  return commity if commity.save

  create_commity(building)
end

def create_commitee_member(commity, user)
  FactoryBot.create(:commitee_member, commity: commity, user: user)
end
