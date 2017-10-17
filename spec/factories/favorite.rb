FactoryGirl.define do
  factory :favorite do
    user { create(:user) }
    tweet { create(:tweet) }
  end
end
