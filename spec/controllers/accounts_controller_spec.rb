# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  login_client

  describe 'GET #index' do
    context 'all accounts' do
      let!(:account) { FactoryBot.create(:account, client: @client) }

      it do
        get :index, params: { client_id: @client.id }
        accounts = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(accounts.first['id']).to eq(account.id)
        expect(accounts.count).to eq 1
      end
    end
  end

  describe 'GET #show' do
    context 'show account' do
      let!(:account) { FactoryBot.create(:account, client: @client) }

      it do
        get :show, params: { client_id: @client.id, id: account.id }

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['id']).to eq account.id
      end
    end
  end

  describe 'POST #create' do
    context 'valid params' do
      it do
        post :create, params: { client_id: @client.id, account: { balance: 100 } }

        expect(response).to have_http_status(:success)
      end
    end

    context 'invalid params' do
      it do
        post :create, params: { client_id: @client.id, account: { balance: -100 } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'destroy account' do
      let!(:account) { FactoryBot.create(:account, client: @client) }

      it do
        delete :destroy, params: { client_id: @client.id, id: account.id }

        expect(response).to have_http_status(:success)
      end
    end
  end
end
