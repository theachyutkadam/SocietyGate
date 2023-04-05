class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.references :sector, null: false, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.string :is_private
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
