# frozen_string_literal: true

class CreateCommities < ActiveRecord::Migration[7.0]
  def change
    create_table :commities do |t|
      t.string :title
      t.references :building, null: false, foreign_key: true
      t.integer :members_limit

      t.timestamps
    end
  end
end
