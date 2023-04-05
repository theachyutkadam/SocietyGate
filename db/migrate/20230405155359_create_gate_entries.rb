# frozen_string_literal: true

class CreateGateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :gate_entries do |t|
      t.integer :entry_type
      t.integer :status
      t.references :flat, null: false, foreign_key: true
      t.string :vehicle_number
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.string :contact
      t.string :vehicale_image_url
      t.string :person_image_url

      t.timestamps
    end
  end
end
