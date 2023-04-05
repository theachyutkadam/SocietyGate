# frozen_string_literal: true

class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.string :title
      t.integer :complaint_type
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.references :sector, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
