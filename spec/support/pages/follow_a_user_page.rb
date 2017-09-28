require 'support/pages/00_page'

class FollowAUserPage < Page
  def visit_a_user_profile(user)
    visit("/")
    click_link user.email
  end

  def follow
    click_button 'Follow'
  end
end
