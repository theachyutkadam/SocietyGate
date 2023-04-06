# frozen_string_literal: true

class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.string :number
      t.integer :number_of_flats
      t.boolean :is_refuge_area
      t.references :wing, null: false, foreign_key: true
      t.boolean :fire_exebution
      t.datetime :service_at

      t.timestamps
    end
  end
end
