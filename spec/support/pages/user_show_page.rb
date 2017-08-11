require 'support/pages/00_page'

class UserShowPage < Page

  def go_to_own_profile(user_info)
    click_link user_info.email
  end
end
