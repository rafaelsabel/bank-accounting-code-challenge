# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:source_account) }
    it { is_expected.to belong_to(:destination_account) }
  end

  describe 'validations' do
    context 'numericality' do
      it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
      it { is_expected.to validate_numericality_of(:amount).is_less_than(10**10) }
    end

    let(:valid_transfer) { FactoryBot.build(:transfer, amount: 10, source_account: FactoryBot.create(:source_account, balance: 15)) }
    let(:invalid_transfer) { FactoryBot.build(:transfer, amount: 10, source_account: FactoryBot.create(:source_account, balance: 5)) }

    context 'source_account_balance' do
      it { expect(valid_transfer).to be_valid }
      it { expect(invalid_transfer).to be_invalid }
    end
  end

  describe 'create' do
    let(:valid_transfer) { FactoryBot.build(:transfer) }
    let(:invalid_transfer) { FactoryBot.build(:transfer, amount: 0) }

    it 'is valid with valid attributes' do
      expect(valid_transfer).to be_valid
    end

    it 'is not valid' do
      expect(invalid_transfer).to_not be_valid
    end
  end

  describe 'confirm_transfer' do
    let(:source_account) { FactoryBot.create(:source_account, balance: 15) }
    let(:destination_account) { FactoryBot.create(:destination_account, balance: 5) }

    let!(:transfer) do
      FactoryBot.create(:transfer, amount: 5, source_account: source_account, destination_account: destination_account)
    end

    it 'source account balance' do
      source_account.reload
      expect(source_account.balance).to eq(10)
    end

    it 'destination account balance' do
      destination_account.reload
      expect(destination_account.balance).to eq(10)
    end
  end
end
