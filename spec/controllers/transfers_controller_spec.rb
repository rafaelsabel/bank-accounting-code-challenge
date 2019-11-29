# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransfersController, type: :controller do
  login_client

  describe 'POST #create' do
    let!(:source_account) { FactoryBot.create(:source_account, client: @client, balance: 100) }
    let!(:destination_account) { FactoryBot.create(:destination_account, balance: 50) }

    context 'valid params' do
      it do
        post :create, params: { client_id: @client.id, transfer: {
          source_account_id: source_account.id,
          destination_account_id: destination_account.id,
          amount: 10
        } }

        source_account.reload
        destination_account.reload

        expect(response).to have_http_status(:success)
        expect(source_account.balance).to eq(90)
        expect(destination_account.balance).to eq(60)
      end
    end

    context 'invalid params' do
      it do
        post :create, params: { client_id: @client.id, transfer: {
          source_account_id: source_account.id,
          destination_account_id: destination_account.id,
          amount: 100
        } }

        source_account.reload
        destination_account.reload

        expect(response).to have_http_status(:unprocessable_entity)
        expect(source_account.balance).to eq(100)
        expect(destination_account.balance).to eq(50)
      end
    end
  end
end
