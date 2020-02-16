# frozen_string_literal: true

# Controller spec
require 'rails_helper'

RSpec.describe YearsController, type: :controller do

  let(:valid_attributes) do
    { year: '2020' }
  end

  let(:invalid_attributes) do
    { year: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Year.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      year = Year.create! valid_attributes
      get :show, params: { id: year.to_param }
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
      year = Year.create! valid_attributes
      get :edit, params: { id: year.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Year' do
        expect do
          post :create, params: { year: valid_attributes }
        end.to change(Year, :count).by(1)
      end

      it 'redirects to the created year' do
        post :create, params: { year: valid_attributes }
        expect(response).to redirect_to(Year.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { year: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { year: '2021' }
      end

      it 'updates the requested year' do
        year = Year.create! valid_attributes
        put :update, params: { id: year.to_param, year: new_attributes }
        year.reload
        expect(assigns(:year)[:year]).to eq(new_attributes[:year])
      end

      it 'redirects to the year' do
        year = Year.create! valid_attributes
        put :update, params: { id: year.to_param, year: valid_attributes }
        expect(response).to redirect_to(year)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        year = Year.create! valid_attributes
        put :update, params: { id: year.to_param, year: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested year' do
      year = Year.create! valid_attributes
      expect do
        delete :destroy, params: { id: year.to_param }
      end.to change(Year, :count).by(-1)
    end

    it 'redirects to the years list' do
      year = Year.create! valid_attributes
      delete :destroy, params: { id: year.to_param }
      expect(response).to redirect_to(years_url)
    end
  end

end
