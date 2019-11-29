# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:accounts) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
    end

    context 'length' do
      it { is_expected.to validate_length_of(:name).is_at_most(200) }
      it { is_expected.to validate_length_of(:email).is_at_most(100) }
    end
  end

  describe 'create' do
    let(:valid_client) { FactoryBot.build(:client) }
    let(:invalid_client) { FactoryBot.build(:client, email: '') }

    it 'is valid with valid attributes' do
      expect(valid_client).to be_valid
    end

    it 'is not valid' do
      expect(invalid_client).to_not be_valid
    end
  end
end
