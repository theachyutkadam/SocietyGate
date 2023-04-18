# SocietyGate
This API application create for manage the society system, like gate_entry, notice, events, maintenance etc.
* Factory Create Issues in console.
- require 'factory_bot'
- include FactoryBot::Syntax::Methods

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


rails g scaffold society name city state location status:integer registration_number contact email address:text
git add . && git commit -m "Society model scaffold"

rails g scaffold user password email status:integer is_admin:boolean token society:references user_type:integer is_primary_user:boolean
git add . && git commit -m "User model scaffold"

rails g scaffold user_information first_name middle_name last_name contact gender:integer birth_date:date pan_card_number adhaar_card_number is_handicap:boolean handicap_details:text  maritial_status:integer user:references
git add . && git commit -m "UserInformation model scaffold"

rails g scaffold building society:references name location status:integer
git add . && git commit -m "Building model scaffold"

rails g scaffold wing name building:references number_of_lifts:integer structure:integer
git add . && git commit -m "Wing model scaffold"

rails g scaffold floor number:integer number_of_flats:integer is_refuge_area:boolean wing:references fire_exebution:boolean service_at:datetime
git add . && git commit -m "Floor model scaffold"

rails g scaffold flat number:integer owner:references floor:references area_in_feet:integer is_rented:boolean tenant:references structure:integer letter_box_number electricity_meter_number gas_meter_number
git add . && git commit -m "Flat model scaffold"

rails g scaffold tenant_history tenant:references flat:references move_in_at:date move_out_at:date
git add . && git commit -m "TenantHistory model scaffold"

rails g scaffold address building flat_number:integer road taluka district state pin_code user:references
git add . && git commit -m "Address model scaffold"

rails g scaffold amenity name start_time:datetime end_time:datetime is_paid:boolean only_for:integer fee:float building:references terms_and_conditions:text
git add . && git commit -m "Amenity model scaffold"

rails g scaffold parking number is_covered:boolean size_in_feet:integer building:references owner:references flat:references
git add . && git commit -m "Parking model scaffold"

rails g scaffold vehicle number name vehicle_type:integer color flat:references user:references
git add . && git commit -m "Vehicle model scaffold"

rails g scaffold document user:references name images description:text
git add . && git commit -m "Document model scaffold"

rails g scaffold gate_entry entry_type:integer status:integer flat:references vehicle_number first_name last_name gender:integer contact vehicale_image_url person_image_url
git add . && git commit -m "GateEntry model scaffold"

rails g scaffold family_member first_name last_name contact birth_date:date gender:integer flat:references pan_card_number adhaar_card_number avatar_url maritial_status:integer status:integer relation_with:integer
git add . && git commit -m "FamilyMember model scaffold"

rails g scaffold complaint title complaint_type:integer user:references description:text building:references flat:references
git add . && git commit -m "Complaint model scaffold"

rails g scaffold event name building:references start_at:datetime end_at:datetime is_private flat:references
git add . && git commit -m "Event model scaffold"

rails g scaffold commity title building:references members_limit:integer
git add . && git commit -m "Commity model scaffold"

rails g scaffold commitee_member name user:references members_count:integer commity:references designation:integer
git add . && git commit -m "CommiteeMember model scaffold"

bin/rails db:environment:set RAILS_ENV=development && rails db:drop db:create db:migrate

rails g annotate:install

rails g motor:install && rake db:migrate
<!-- rails g motor:upgrade && rake db:migrate -->

*Check factory data*
require 'factory_bot'
include FactoryBot::Syntax::Methods

society = create(:society)
user = create(:user, society: society)

user_information = create(:user_information, user: user)
user_information.avatar.attach(io: File.open(Dir.glob(File.join(Rails.root, '/public/avatar/', '*')).sample), filename: "#{user_information.id}.jpg")

user2 = create(:user, society: society)
user_information2 = create(:user_information, user: user2)
building = create(:building, society: society)
wing = create(:wing, building: building)
floor = create(:floor, wing: wing)
flat = create(:flat, floor: floor, owner: user, tenant: user2)
address = create(:address, user: user)
tenant_history = create(:tenant_history, flat: flat, tenant: user2)
amenity = create(:amenity, building: building)
parking = create(:parking, building: building, flat: flat, owner: user2)
vehicle = create(:vehicle, flat: flat, user: user2)
family_member = create(:family_member, flat: flat)
document = create(:document, user: user)
gate_entry = create(:gate_entry, flat: flat)
complaint = create(:complaint, building: building, flat: flat, user: user2)
event = create(:event, building: building, flat: flat)
commity = create(:commity, building: building)
commitee_member = create(:commitee_member, commity:commity, user: user)