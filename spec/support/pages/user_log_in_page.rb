require 'support/pages/00_page'

class UserSignUpPage < Page

  def fill_in_account_information(user_info)
    fill_in 'Email', with: user_info.email
    fill_in 'Password', with: user_info.password
  end

  def submit
    click_button 'Sign Up'
  end
end
