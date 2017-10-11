FactoryGirl.define do
  factory :relationship do
    follower { create(:user) }
    followed { create(:user, { email: "foo2@bar.com"} ) }
  end
end
