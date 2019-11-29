# frozen_string_literal: true

FactoryBot.define do
  factory :transfer do
    association :source_account
    association :destination_account

    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
