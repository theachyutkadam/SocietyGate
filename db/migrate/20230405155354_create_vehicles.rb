# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :number
      t.string :company
      t.string :name
      t.integer :vehicle_type
      t.string :color
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
