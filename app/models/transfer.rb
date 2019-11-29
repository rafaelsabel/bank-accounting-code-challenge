# frozen_string_literal: true

class Transfer < ApplicationRecord
  belongs_to :source_account, class_name: Account.to_s
  belongs_to :destination_account, class_name: Account.to_s

  after_create :confirm_transfer

  validates :amount, numericality: { greater_than: 0, less_than: 10**10 }

  validate :source_account_balance

  private

  def source_account_balance
    return if source_account.blank? || source_account.has_balance?(amount)

    errors.add(:source_account_id, 'Saldo insuficiente.')
  end

  def confirm_transfer
    ActiveRecord::Base.transaction do
      source_account.lock!
      source_account.balance -= amount

      destination_account.lock!
      destination_account.balance += amount

      source_account.save!
      destination_account.save!
    end
  end
end
