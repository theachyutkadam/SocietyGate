# frozen_string_literal: true

class CreateSocieties < ActiveRecord::Migration[7.0]
  def change
    create_table :societies do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :city
      t.string :state
      t.string :location
      t.integer :status
      t.string :registration_number, null: false, index: { unique: true }
      t.string :contact, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.text :address

      t.timestamps
    end
  end
end
