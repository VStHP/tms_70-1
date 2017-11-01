FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    password "123123"
    password_confirmation "123123"
    gender 1
    date_start Time.now
    university {Faker::University.name}
    organization {Faker::Address.city}
    program {Faker::Team.name}
    suppervisor 1
    email { Faker::Internet.email }
  end
end
