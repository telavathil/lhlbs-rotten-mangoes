class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.string :firstname
      t.string :lastname
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
