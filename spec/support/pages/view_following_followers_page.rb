require 'support/pages/00_page'

class ViewFollowingFollowersPage < Page
  def view_followers
    find(".qa-user-followers").click
  end
end
