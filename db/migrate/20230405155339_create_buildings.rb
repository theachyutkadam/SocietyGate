# frozen_string_literal: true

class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.references :society, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.integer :status

      t.timestamps
    end
  end
end
