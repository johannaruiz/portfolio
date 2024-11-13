# frozen_string_literal: true

FactoryBot.define do
  factory :inquiry do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    message { 'Inquiry system testing test' }
    kind { :basic }
    phone { nil }
    company { nil }

    trait :employment do
      kind { :employment }
      phone { Faker::PhoneNumber.phone_number }
      company { 'RCorp' }
    end
  end
end
