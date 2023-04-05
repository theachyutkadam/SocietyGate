# frozen_string_literal: true

class CreateFamilyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.date :birth_date
      t.integer :gender
      t.references :flat, null: false, foreign_key: true
      t.string :pan_card_number
      t.string :adhaar_card_number
      t.string :avatar_url
      t.integer :maritial_status
      t.integer :status
      t.integer :relation_with

      t.timestamps
    end
  end
end
