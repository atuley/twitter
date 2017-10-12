FactoryGirl.define do
  factory :favorite do
    user { create(:user, :skip_validate) }
    tweet { create(:tweet) }
  end
end
