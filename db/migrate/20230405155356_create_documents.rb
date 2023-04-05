class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :images
      t.text :description

      t.timestamps
    end
  end
end
