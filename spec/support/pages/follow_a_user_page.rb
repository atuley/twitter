require 'support/pages/00_page'

class FollowAUserPage < Page
  def visit_a_user_profile(user)
    visit "/"
    find(".qa-user-email-#{user.id}").click
  end

  def follow
    find(".qa-follow-a-user").click
  end
end
