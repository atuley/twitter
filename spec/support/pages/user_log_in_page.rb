require 'support/pages/00_page'

class UserLogInPage < Page
  def fill_in_account_information(user_info)
    fill_in :email, with: user_info.email
    fill_in :password, with: user_info.password
  end

  def submit
    click_button 'qa-log-in'
  end

  def sign_in(user)
    visit "/login"
    fill_in_account_information(user)
    submit
  end
end
