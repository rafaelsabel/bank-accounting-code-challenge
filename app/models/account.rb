# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :client

  has_many :inbound_transfers, class_name: Transfer.to_s, foreign_key: :destination_account_id, dependent: :destroy
  has_many :outbound_transfers, class_name: Transfer.to_s, foreign_key: :source_account_id, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0, less_than: 10**20 }

  def has_balance?(amount)
    balance > amount
  end
end
