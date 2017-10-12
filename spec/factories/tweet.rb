FactoryGirl.define do
  factory :tweet do
    user { create(:user, :skip_validate) }
    content "This is a tweet"
  end
end
