FactoryGirl.define do
  factory :relationship do
    follower { create(:user, :skip_validate) }
    followed { create(:user, :skip_validate, { email: "foo2@bar.com"} ) }
  end
end
