# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_accounts, only: %i[show destroy]

  def index
    render json: current_client.accounts, status: :ok
  end

  def show
    render json: @account, status: :ok
  end

  def create
    account = current_client.accounts.new(params.require(:account).permit(:balance))

    if account.save
      render json: account.id, status: :created
    else
      render json: account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
    render body: nil
  end

  private

  def set_accounts
    @account = current_client.accounts.find_by(id: params[:id])

    render json: 'Conta inválida', status: :not_found if @account.blank?
  end
end
