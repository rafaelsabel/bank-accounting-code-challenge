# frozen_string_literal: true

class Client < ApplicationRecord
  devise :database_authenticatable, :confirmable, :validatable

  has_many :accounts, dependent: :destroy

  validates :name, length: { maximum: 200 }, presence: true
  validates :email, length: { maximum: 100 }, presence: true
end
