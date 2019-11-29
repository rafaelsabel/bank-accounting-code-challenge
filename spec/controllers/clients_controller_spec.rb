# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  login_client

  describe 'GET #index' do
    context 'all clients' do
      it do
        get :index
        clients = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(clients.count).to eq 1
      end
    end
  end

  describe 'GET #show' do
    context 'show client' do
      it do
        get :show, params: { id: @client.id }
        client = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(client['id']).to eq @client.id
      end
    end
  end

  describe 'POST #create' do
    context 'valid params' do
      it do
        post :create, params: { client: { name: 'Rafael', email: 'rafael@email.com', password: 'Senha123.' } }

        expect(response).to have_http_status(:success)
      end
    end

    context 'invalid params' do
      it do
        post :create, params: { client: { name: 'Rafael', email: 'rafael.email.com', password: 'Senha123.' } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'valid params' do
      it do
        put :update, params: { id: @client.id, client: { name: 'Rafael' } }

        @client.reload

        expect(response).to have_http_status(:success)
        expect(@client.name).to eq('Rafael')
      end
    end

    context 'invalid params' do
      it do
        put :update, params: { id: @client.id, client: { name: '' } }

        @client.reload

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'destroy client' do
      it do
        delete :destroy, params: { id: @client.id }

        expect(response).to have_http_status(:success)
      end
    end
  end
end
