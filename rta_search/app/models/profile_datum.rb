# frozen_string_literal: true

# ProfileDatum Model
class ProfileDatum < ApplicationRecord

  def readonly?
    true
  end

  self.primary_key = :id

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name,
      concurrently: true,
      cascade: false)
  end
end