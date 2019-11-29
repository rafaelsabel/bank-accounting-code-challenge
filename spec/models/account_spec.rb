# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:client) }
    it { is_expected.to have_many(:inbound_transfers) }
    it { is_expected.to have_many(:outbound_transfers) }
  end

  describe 'validations' do
    context 'numericality' do
      it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:balance).is_less_than(10**20) }
    end
  end

  describe 'create' do
    let(:valid_account) { FactoryBot.build(:account) }
    let(:invalid_account) { FactoryBot.build(:account, balance: -10) }

    it 'is valid with valid attributes' do
      expect(valid_account).to be_valid
    end

    it 'is not valid' do
      expect(invalid_account).to_not be_valid
    end
  end

  describe 'has_balance?' do
    let(:account) { FactoryBot.build(:account, balance: 100) }

    it 'with balance' do
      expect(account.has_balance?(90)).to be true
    end

    it 'without balance' do
      expect(account.has_balance?(110)).to be false
    end
  end
end
