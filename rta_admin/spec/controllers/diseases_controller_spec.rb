# frozen_string_literal: true

# Disease Controller RSpec
require 'rails_helper'

RSpec.describe DiseasesController, type: :controller do

  let(:valid_attributes) do
    { name: 'Disease 1' }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Disease.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      disease = Disease.create! valid_attributes
      get :show, params: { id: disease.to_param }
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
      disease = Disease.create! valid_attributes
      get :edit, params: { id: disease.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Disease' do
        expect {
          post :create, params: { disease: valid_attributes }
        }.to change(Disease, :count).by(1)
      end

      it 'redirects to the created disease' do
        post :create, params: { disease: valid_attributes }
        expect(response).to redirect_to(Disease.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { disease: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'Disease 2' }
      end

      it 'updates the requested disease' do
        disease = Disease.create! valid_attributes
        put :update, params: { id: disease.to_param, disease: new_attributes }
        disease.reload
        expect(assigns(:disease)[:name]).to eq(new_attributes[:name])
      end

      it 'redirects to the disease' do
        disease = Disease.create! valid_attributes
        put :update, params: { id: disease.to_param, disease: valid_attributes }
        expect(response).to redirect_to(disease)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        disease = Disease.create! valid_attributes
        put :update, params: { id: disease.to_param, disease: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested disease' do
      disease = Disease.create! valid_attributes
      expect {
        delete :destroy, params: { id: disease.to_param }
      }.to change(Disease, :count).by(-1)
    end

    it 'redirects to the diseases list' do
      disease = Disease.create! valid_attributes
      delete :destroy, params: { id: disease.to_param }
      expect(response).to redirect_to(diseases_url)
    end
  end

end
