# frozen_string_literal: true

# Age controller spec
require 'rails_helper'

RSpec.describe AgesController, type: :controller do

  let(:valid_attributes) do
    { range: '0 - 10' }
  end

  let(:invalid_attributes) do
    { range: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Age.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      age = Age.create! valid_attributes
      get :show, params: { id: age.to_param }
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
      age = Age.create! valid_attributes
      get :edit, params: { id: age.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Age' do
        expect do
          post :create, params: { age: valid_attributes }
        end.to change(Age, :count).by(1)
      end

      it 'redirects to the created age' do
        post :create, params: { age: valid_attributes }
        expect(response).to redirect_to(Age.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { age: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { range: '10 - 20' }
      end

      it 'updates the requested age' do
        age = Age.create! valid_attributes
        put :update, params: { id: age.to_param, age: new_attributes }
        age.reload
        expect(assigns(:age)[:range]).to eq(new_attributes[:range])
      end

      it 'redirects to the age' do
        age = Age.create! valid_attributes
        put :update, params: { id: age.to_param, age: valid_attributes }
        expect(response).to redirect_to(age)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        age = Age.create! valid_attributes
        put :update, params: { id: age.to_param, age: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested age' do
      age = Age.create! valid_attributes
      expect do
        delete :destroy, params: { id: age.to_param }
      end.to change(Age, :count).by(-1)
    end

    it 'redirects to the ages list' do
      age = Age.create! valid_attributes
      delete :destroy, params: { id: age.to_param }
      expect(response).to redirect_to(ages_url)
    end
  end

end
