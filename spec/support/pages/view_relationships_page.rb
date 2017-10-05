require 'support/pages/00_page'

class ViewRelationshipsPage < Page
  def view_followers
    find(".qa-user-followers").click
  end
end
