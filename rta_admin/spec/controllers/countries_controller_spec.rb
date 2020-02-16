# frozen_string_literal: true

# Country Controller spec
require 'rails_helper'

RSpec.describe CountriesController, type: :controller do

  let(:valid_attributes) do
    { name: 'Bangladesh',
      code: 'BD' }
  end

  let(:invalid_attributes) do
    { name: nil,
      code: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Country.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      country = Country.create! valid_attributes
      get :show, params: { id: country.to_param }
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
      country = Country.create! valid_attributes
      get :edit, params: { id: country.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Country' do
        expect do
          post :create, params: { country: valid_attributes }
        end.to change(Country, :count).by(1)
      end

      it 'redirects to the created country' do
        post :create, params: { country: valid_attributes }
        expect(response).to redirect_to(Country.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { country: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'United Kingdom' }
      end

      it 'updates the requested country' do
        country = Country.create! valid_attributes
        put :update, params: { id: country.to_param, country: new_attributes }
        country.reload
        expect(assigns(:country)[:name]).to eq(new_attributes[:name])
      end

      it 'redirects to the country' do
        country = Country.create! valid_attributes
        put :update, params: { id: country.to_param, country: valid_attributes }
        expect(response).to redirect_to(country)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        country = Country.create! valid_attributes
        put :update, params: { id: country.to_param, country: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested country' do
      country = Country.create! valid_attributes
      expect do
        delete :destroy, params: { id: country.to_param }
      end.to change(Country, :count).by(-1)
    end

    it 'redirects to the countries list' do
      country = Country.create! valid_attributes
      delete :destroy, params: { id: country.to_param }
      expect(response).to redirect_to(countries_url)
    end
  end

end
