class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :status
      t.datetime :deleted_at
      t.datetime :suspended_at

      t.timestamps
    end
    add_index :users, :deleted_at
  end
end
