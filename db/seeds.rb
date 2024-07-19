# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "factory_bot"

require_relative "./create_record"

Rails.logger.debug "Seeding..."
start_time = Time.zone.now

start_seeding # create data from another file.

end_time = Time.zone.now
Rails.logger.debug "Seeding done from #{start_time} to #{end_time}."
Rails.logger.debug "Total Time = #{end_time - start_time}"
Rails.logger.debug ApplicationRecord.record_count
