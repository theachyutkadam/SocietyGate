# frozen_string_literal: true

class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities do |t|
      t.string :name
      t.time :open_time
      t.time :close_time
      t.boolean :is_paid
      t.integer :only_for
      t.float :fee
      t.references :building, null: false, foreign_key: true
      t.text :terms_and_conditions

      t.timestamps
    end
  end
end
