# frozen_string_literal: true

@flats = 6
@wings = 3
@floors = 10
@buildings = 3
@counter = 0

def start_seeding
  society = FactoryBot.create(:society)
  @buildings.times { |num| create_building(num, society) }
end

def create_building(num, society)
  building = FactoryBot.create(:building, name: "R#{num + 1}", society:)
  puts
  puts "building name - R#{num + 1}"
  @wings.times do |num|
    create_amenity(building)
    puts "Added amenity"
    create_wing(num, building)
  end
  create_commity(building)
end

def create_wing(num, building)
  wing = FactoryBot.build(:wing, building:)
  puts "wing name - #{building.name}/#{wing.name}"
  if wing.save
    @floors.times { |num| create_floor(num + 1, wing, building.society) }
  else
    return_error_log(wing)
    create_wing(num, building)
  end
end

def create_floor(floor_num, wing, society)
  puts "floor - #{wing.name}-#{floor_num.ordinalize}"
  floor = FactoryBot.create(:floor, number: floor_num.ordinalize.to_s, wing:, number_of_flats: 12)
  @flats.times { |flat_num| create_flat(flat_num + 1, floor, floor_num, society) }
end

def create_flat(flat_num, floor, floor_num, society)
  number = "#{floor_num}#{format('%02d', flat_num)}"
  puts "flat #{number} "
  flat = FactoryBot.build(:flat, number:, floor:, owner: create_user(society))
  puts "Added Owner with UI "

  flat.tenant = create_user(society, user_type: "tenant") if flat.is_rented
  flat.save

  if flat.is_rented
    3.times do |number|
      create_tenant_history(flat, flat.tenant, number)
      puts "tenant history created"
    end
  end

  create_parking(flat.wing.building, flat.owner, flat)
  rand(1..4).times { |_num| create_family_member(flat) }
  puts
end

def create_user(society, user_type: "owner")
  user = FactoryBot.build(:user, society:, user_type:)
  if user.save
    create_user_information(user)
    create_address(user)
    puts "address created"
    user
  else
    return_error_log(user)
    create_user(society)
  end
end

def create_user_information(user)
  user_info = FactoryBot.build(:user_information, user:)
  return user_info if user_info.save

  return_error_log(user_info)
  create_user_information(user)
end

def create_tenant_history(flat, tenant, number)
  tenant_user = User.tenant.sample
  move_in_at = Faker::Date.backward(days: 2000)
  move_out_at = Faker::Date.backward(days: 25)
  if number == 2
    tenant_user = tenant
    move_in_at = Time.zone.today
    move_out_at = nil
  end
  tenant_history = FactoryBot.build(:tenant_history, flat:, tenant: tenant_user, move_in_at:,
                                                     move_out_at:)
  return tenant_history if tenant_history.save

  return_error_log(tenant_history)
  create_tenant_history(flat, tenant, number)
end

def create_address(user)
  address = FactoryBot.build(:address, user:)
  return address if address.save

  return_error_log(address)
  create_address(user)
end

def create_amenity(building)
  amenity = FactoryBot.build(:amenity, building:)
  return amenity if amenity.save

  return_error_log(amenity)
  create_amenity(building)
end

def create_parking(building, owner, flat)
  owner = flat.tenant if flat.is_rented
  parking = FactoryBot.build(:parking, number: flat.letter_box_number.to_s, building:, owner:,
                                       flat:)
  puts "Assign Parking "
  if parking.save
    rand(1..4).times { |_num| create_vehicle(flat, owner) }
    nil
  else
    return_error_log(parking)
    create_parking(building, owner, flat)
  end

  create_complaint(flat, owner, building)
  # create_commitee_member(commity,  owner)
end

def create_vehicle(flat, user)
  puts "Add Vehicle "
  vehicle = FactoryBot.build(:vehicle, flat:, user:)
  return vehicle if vehicle.save

  return_error_log(vehicle)
  create_vehicle(flat, user)
end

def create_family_member(flat)
  family_member = FactoryBot.build(:family_member, flat:)
  puts "Add Family Member "
  if family_member.save
    create_document(flat.owner)
    rand(1..4).times { |_num| create_gate_entry(flat) }
    family_member
  else
    return_error_log(family_member)
    create_family_member(flat)
  end
end

def create_document(user)
  puts "Create Document"
  document = FactoryBot.build(:document, user:)
  return document if document.save

  return_error_log(document)
  create_gate_entry(user)
end

def create_gate_entry(flat)
  puts "Create Gate Entry"
  gate_entry = FactoryBot.build(:gate_entry, flat:)
  return gate_entry if gate_entry.save

  return_error_log(gate_entry)
  create_gate_entry(flat)
end

def create_complaint(flat, user, building)
  puts "Create Complaint"
  complaint = FactoryBot.build(:complaint, flat:, user:, building:)
  return complaint if complaint.save

  return_error_log(complaint)
  create_complaint(flat, user, building)
end

def create_event
  FactoryBot.create(:event)
end

def create_commity(building)
  puts "Add Commity"
  commity = FactoryBot.build(:commity, building:, title: "#{building.name} Admin")
  return commity if commity.save

  create_commity(building)
end

def create_commitee_member(commity, user)
  FactoryBot.create(:commitee_member, commity:, user:)
end

def return_error_log(object)
  puts "+++--------#{object.class.name} errors - #{object.errors.each do |error|
                                                                   puts error.message
                                                                 end}--------+++"
end
