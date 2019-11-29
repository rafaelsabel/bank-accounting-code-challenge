# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { 'Cliente' }
    sequence(:email) { |n| "cliente#{n}@email.com" }
    password { 'password' }
    confirmed_at { DateTime.now }
  end
end
