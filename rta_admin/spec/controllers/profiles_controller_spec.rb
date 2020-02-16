# frozen_string_literal: true

#  Profile Controller spec
require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:user) { FactoryBot.create :user }
  let(:year) { FactoryBot.create :year }
  let(:month) { FactoryBot.create :month }
  let(:age) { FactoryBot.create :age }
  let(:country) { FactoryBot.create :country }
  let(:disease) { FactoryBot.create :disease }

  let(:valid_attributes) do
    { name: 'Johns Profile',
      gender: 'male',
      profile_type: 'patient',
      user_id: user.id,
      year_id:  year.id,
      month_id: month.id,
      age_id: age.id,
      country_id: country.id,
      disease_id: disease.id }
  end

  let(:invalid_attributes) do
    { name: 'Johns Profile',
      gender: nil,
      user_id: user.id,
      profile_type: nil,
      year_id:  nil,
      month_id: month.id,
      age_id: age.id,
      country_id: country.id,
      disease_id: disease.id }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Profile.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      profile = Profile.create! valid_attributes
      get :show, params: { id: profile.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      profile = Profile.create! valid_attributes
      get :edit, params: { id: profile.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Profile' do
        expect do
          post :create, params: { profile: valid_attributes }
        end.to change(Profile, :count).by(1)
      end

      it 'redirects to the created profile' do
        post :create, params: { profile: valid_attributes }
        expect(response).to redirect_to(Profile.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { profile: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { profile_type: 'carer' }
      end

      it 'updates the requested profile' do
        profile = Profile.create! valid_attributes
        put :update, params: { id: profile.to_param, profile: new_attributes }
        profile.reload
        expect(assigns(:profile)[:profile_type]).to eq(new_attributes[:profile_type])
      end

      it 'redirects to the profile' do
        profile = Profile.create! valid_attributes
        put :update, params: { id: profile.to_param, profile: valid_attributes }
        expect(response).to redirect_to(profile)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        profile = Profile.create! valid_attributes
        put :update, params: { id: profile.to_param, profile: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested profile' do
      profile = Profile.create! valid_attributes
      expect do
        delete :destroy, params: { id: profile.to_param }
      end.to change(Profile, :count).by(-1)
    end

    it 'redirects to the profiles list' do
      profile = Profile.create! valid_attributes
      delete :destroy, params: { id: profile.to_param }
      expect(response).to redirect_to(profiles_url)
    end
  end

end
