class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :gender
      t.integer :profile_type
      t.references :year, foreign_key: true
      t.references :month, foreign_key: true
      t.references :country, foreign_key: true
      t.references :disease, foreign_key: true
      t.references :age, foreign_key: true

      t.timestamps
    end
  end
end
