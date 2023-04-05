# frozen_string_literal: true

class CreateCommiteeMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :commitee_members do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :members_count
      t.references :commity, null: false, foreign_key: true
      t.integer :designation

      t.timestamps
    end
  end
end
