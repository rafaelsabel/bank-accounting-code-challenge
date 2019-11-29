# frozen_string_literal: true

class TransfersController < ApplicationController
  def create
    params = transfer_params
    source_account = current_client.accounts.find_by(id: params[:source_account_id])

    if source_account.present?
      transfer = source_account.outbound_transfers.build(params)

      if transfer.save
        render json: transfer.id, status: :ok
      else
        render json: transfer.errors, status: :unprocessable_entity
      end
    else
      render json: 'Conta inválida', status: :ok if source_account.blank?
    end
  end

  def transfer_params
    params.require(:transfer).permit(
      :source_account_id,
      :destination_account_id,
      :amount
    )
  end
end
