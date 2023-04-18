# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.record_count
    puts "***************************************"
    puts "---#{Society.count} - Society"
    puts "---#{Building.count} - Building"
    puts "---#{Wing.count} - Wing"
    puts "---#{Floor.count} - Floor"
    puts "---#{Flat.count} - Flat"
    puts "---#{User.count} - User"
    puts "---#{UserInformation.count} - UserInformation"
    puts "---#{TenantHistory.count} - TenantHistory"
    puts "---#{Address.count} - Address"
    puts "---#{Parking.count} - Parking"
    puts "---#{Vehicle.count} - Vehicle"
    puts "---#{FamilyMember.count} - FamilyMember"
    puts "---#{Document.count} - Document"
    puts "---#{Amenity.count} - Amenity"
    puts "---#{GateEntry.count} - GateEntry"
    puts "---#{Complaint.count} - Complaint"
    puts "---#{Event.count} - Event"
    puts "---#{Commity.count} - Commity"
    puts "---#{CommiteeMember.count} - CommiteeMember"
    puts "***************************************"
  end
end
