# frozen_string_literal: true

class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.string :number
      t.boolean :is_covered
      t.integer :size_in_feet
      t.references :building, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
