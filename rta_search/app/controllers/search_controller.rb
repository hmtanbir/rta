# frozen_string_literal: true

# Search table
class SearchController < ApplicationController
  before_action :permit_params_for_profile, only: :index
  before_action :required_objects, only: :index

  def index
    ProfileDatum.refresh
    @query = ProfileDatum.ransack(params[:q])
    @profiles = @query.result(distinct: true)
  end

  private

  def permit_params_for_profile
    @params = params.permit(q: %i[user_name_cont email_eq status_eq gender_eq profile_type_eq age_range_eq country_code_eq disease_name_eq year_eq month_code_eq])
  end

  def required_objects
    @statuses = User.statuses.keys
    @genders = Profile.genders.keys
    @countries = Country.distinct.pluck(:code).compact.sort
    @years = Year.distinct.pluck(:year).compact.sort
    @months = Month.distinct.pluck(:code).compact.sort
    @ages = Age.distinct.pluck(:range).compact.sort
    @types = Profile.profile_types.keys
    @diseases = Disease.distinct.pluck(:name).compact.sort
  end
end
