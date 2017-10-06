require 'rails_helper'

feature 'view relationships' do
  let!(:tweet) { create(:tweet) }
  let!(:user) { create(:user, {email: 'foo2@bar.com'}) }

  before(:each) do
    user_log_in_page.sign_in(user)

    follow_a_user_page.visit_a_user_profile(tweet.user)
    follow_a_user_page.follow
  end

  scenario 'view followers' do
    view_relationships_page.view_followers

    expect(current_path).to eq("/relationships/#{tweet.user.id}")
    expect(view_relationships_page).to have_text(user.email)
  end
end
