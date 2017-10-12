FactoryGirl.define do
  factory :user do
    email "foo@bar.com"
    password "password"
    password_confirmation "password"

    trait :skip_validate do
      to_create {|instance| instance.save(validate: false)}
    end
  end
end
