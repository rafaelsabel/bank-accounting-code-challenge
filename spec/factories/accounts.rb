# frozen_string_literal: true

FactoryBot.define do
  factory :account, aliases: %i[source_account destination_account] do
    association :client

    balance { Faker::Number.decimal(l_digits: 5, r_digits: 2) }
  end
end
