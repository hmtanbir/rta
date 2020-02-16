# frozen_string_literal: true

# months controller spec
require 'rails_helper'

RSpec.describe MonthsController, type: :controller do

  let(:valid_attributes) do
    { name: 'January',
      code: 'Jan' }
  end

  let(:invalid_attributes) do
    { name: nil,
      code: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Month.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      month = Month.create! valid_attributes
      get :show, params: { id: month.to_param }
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
      month = Month.create! valid_attributes
      get :edit, params: { id: month.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Month' do
        expect do
          post :create, params: { month: valid_attributes }
        end.to change(Month, :count).by(1)
      end

      it 'redirects to the created month' do
        post :create, params: { month: valid_attributes }
        expect(response).to redirect_to(Month.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { month: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'June' }
      end

      it 'updates the requested month' do
        month = Month.create! valid_attributes
        put :update, params: { id: month.to_param, month: new_attributes }
        month.reload
        expect(assigns(:month)[:name]).to eq(new_attributes[:name])
      end

      it 'redirects to the month' do
        month = Month.create! valid_attributes
        put :update, params: { id: month.to_param, month: valid_attributes }
        expect(response).to redirect_to(month)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        month = Month.create! valid_attributes
        put :update, params: { id: month.to_param, month: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested month' do
      month = Month.create! valid_attributes
      expect do
        delete :destroy, params: { id: month.to_param }
      end.to change(Month, :count).by(-1)
    end

    it 'redirects to the months list' do
      month = Month.create! valid_attributes
      delete :destroy, params: { id: month.to_param }
      expect(response).to redirect_to(months_url)
    end
  end

end
