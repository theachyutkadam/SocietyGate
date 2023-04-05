# frozen_string_literal: true

class CreateWings < ActiveRecord::Migration[7.0]
  def change
    create_table :wings do |t|
      t.string :name
      t.references :sector, null: false, foreign_key: true
      t.integer :number_of_lifts
      t.integer :structure

      t.timestamps
    end
  end
end
