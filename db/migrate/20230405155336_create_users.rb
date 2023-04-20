# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password
      t.string :email, null: false, index: { unique: true }
      t.integer :status
      t.boolean :is_admin
      t.string :token, null: false, index: { unique: true }
      t.references :society, null: false, foreign_key: true
      t.integer :user_type
      t.boolean :is_primary_user

      t.timestamps
    end
  end
end
