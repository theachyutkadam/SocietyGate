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
  5.times { |num| create_wing(num, building) }
end

def create_wing(num, building)
  wing = FactoryBot.build(:wing, building: building)
  puts
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
  puts
  puts "floor - #{wing.name}-#{floor_num.ordinalize}"
  floor = FactoryBot.create(:floor, number: floor_num.ordinalize.to_s, wing: wing, number_of_flats: 12)
  12.times { |flat_num| create_flat(flat_num + 1, floor, floor_num, society) }
end

def create_flat(flat_num, floor, floor_num, society)
  number = "#{floor_num}#{format('%02d', flat_num)}"
  print "flat #{number} "
  FactoryBot.create(:flat, number: number, floor: floor, owner: create_user(society))
end

def create_user(society)
  user = FactoryBot.build(:user, society: society)
  if user.valid?
    user.save
    user = User.find_by(email: user.email)
    create_user_information(user)
    user
  else
    puts "@@@@@@User error - #{user.errors.each { |error| puts error.message }}@@@@@@"
    create_user(society)
  end
end
def create_user_information(user)
  user_info = FactoryBot.build(:user_information, user: user)
  if user_info.valid?
    user_info.save
    UserInformation.find_by(contact: user_info.contact)
  else
    puts "@@@@@@UserInformation error - #{user_info.errors.each { |error| puts error.message }}@@@@@@"
    create_user_information(user)
  end
end

def create_tenent_history
  FactoryBot.create(:tenent_history)
end

def create_address
  FactoryBot.create(:address)
end

def create_amenity
  FactoryBot.create(:amenity)
end

def create_parking
  FactoryBot.create(:parking)
end

def create_vehicle
  FactoryBot.create(:vehicle)
end

def create_family_member
  FactoryBot.create(:family_member)
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

def create_commity
  FactoryBot.create(:commity)
end

def create_commitee_member
  FactoryBot.create(:commitee_member)
end
