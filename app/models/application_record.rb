# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.record_count
    record_hash = {}
    Rails.logger.debug "***************************************"
    record_hash["society"] = Society.count
    record_hash["building"] = Building.count
    record_hash["wing"] = Wing.count
    record_hash["floor"] = Floor.count
    record_hash["flat"] = Flat.count
    record_hash["user"] = User.count
    record_hash["user_information"] = UserInformation.count
    record_hash["tenant_history"] = TenantHistory.count
    record_hash["address"] = Address.count
    record_hash["parking"] = Parking.count
    record_hash["vehicle"] = Vehicle.count
    record_hash["family_member"] = FamilyMember.count
    record_hash["document"] = Document.count
    record_hash["amenity"] = Amenity.count
    record_hash["gate_entry"] = GateEntry.count
    record_hash["complain"] = Complaint.count
    record_hash["event"] = Event.count
    record_hash["commity"] = Commity.count
    record_hash["commitee_member"] = CommiteeMember.count
    Rails.logger.debug record_hash.sort.to_h
    Rails.logger.debug "***************************************"
    record_hash.sort_by(&:last).to_h
  end
end
