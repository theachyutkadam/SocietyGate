# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.record_count
    Rails.logger.debug "***************************************"
    Rails.logger.debug "---#{Sector.count} - Sector"
    Rails.logger.debug "---#{Society.count} - Society"
    Rails.logger.debug "---#{User.count} - User"
    Rails.logger.debug "---#{UserInformation.count} - UserInformation"
    Rails.logger.debug "---#{Wing.count} - Wing"
    Rails.logger.debug "---#{Floor.count} - Floor"
    Rails.logger.debug "---#{TenentHistory.count} - TenentHistory"
    Rails.logger.debug "---#{Flat.count} - Flat"
    Rails.logger.debug "---#{Address.count} - Address"
    Rails.logger.debug "---#{Amenity.count} - Amenity"
    Rails.logger.debug "---#{Parking.count} - Parking"
    Rails.logger.debug "---#{Vehicle.count} - Vehicle"
    Rails.logger.debug "---#{FamilyMember.count} - FamilyMember"
    Rails.logger.debug "---#{Document.count} - Document"
    Rails.logger.debug "---#{GateEntry.count} - GateEntry"
    Rails.logger.debug "---#{Complaint.count} - Complaint"
    Rails.logger.debug "---#{Event.count} - Event"
    Rails.logger.debug "---#{Commity.count} - Commity"
    Rails.logger.debug "---#{CommiteeMember.count} - CommiteeMember"
    Rails.logger.debug "***************************************"
  end
end
