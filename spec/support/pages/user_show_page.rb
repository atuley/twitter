require 'support/pages/00_page'

class UserShowPage < Page

  def go_to_own_profile
    find('.qa-current-user-email').click
  end

  def go_to_user_profile(user)
    find(".qa-user-email-#{user.id}").click
  end
end
