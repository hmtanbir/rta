# frozen_string_literal: true

# Profile data Materialized view
class CreateProfileData < ActiveRecord::Migration[5.2]
  def up
    create_view :profile_data, materialized: true
    add_index :profile_data, :id, unique: true
  end

  def down
    drop_view :profile_data, materialized: true
  end
end
