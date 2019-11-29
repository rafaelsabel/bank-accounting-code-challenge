# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :authenticate_client!, except: [:create]

  def index
    clients = Client.all

    render json: clients, status: :ok
  end

  def show
    render json: current_client, status: :ok
  end

  def create
    client = Client.new(params.require(:client).permit(:name, :email, :password))

    if client.save
      render json: client.id, status: :created
    else
      render json: client.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_client.update(params.require(:client).permit(:name))
      render json: current_client.id, status: :ok
    else
      render json: current_client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    current_client.destroy
    render body: nil
  end
end
