# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.record_count
    puts "***************************************"
    puts "---#{Building.count} - Building"
    puts "---#{Society.count} - Society"
    puts "---#{User.count} - User"
    puts "---#{UserInformation.count} - UserInformation"
    puts "---#{Wing.count} - Wing"
    puts "---#{Floor.count} - Floor"
    puts "---#{TenantHistory.count} - TenantHistory"
    puts "---#{Flat.count} - Flat"
    puts "---#{Address.count} - Address"
    puts "---#{Amenity.count} - Amenity"
    puts "---#{Parking.count} - Parking"
    puts "---#{Vehicle.count} - Vehicle"
    puts "---#{FamilyMember.count} - FamilyMember"
    puts "---#{Document.count} - Document"
    puts "---#{GateEntry.count} - GateEntry"
    puts "---#{Complaint.count} - Complaint"
    puts "---#{Event.count} - Event"
    puts "---#{Commity.count} - Commity"
    puts "---#{CommiteeMember.count} - CommiteeMember"
    puts "***************************************"
  end
end
