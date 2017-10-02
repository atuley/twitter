FactoryGirl.define do
  factory :tweet do
    user { create(:user) }
    content "This is a tweet"
  end
end
