# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :building
      t.integer :flat_number
      t.string :road
      t.string :taluka
      t.string :district
      t.string :state
      t.string :pin_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
