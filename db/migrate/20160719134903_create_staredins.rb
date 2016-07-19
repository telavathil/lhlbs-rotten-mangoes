class CreateStaredins < ActiveRecord::Migration[5.0]
  def change
    create_table :staredins do |t|
      t.references :actor, foreign_key: true
      t.references :movie, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
