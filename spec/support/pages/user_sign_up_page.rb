require 'support/pages/00_page'

class UserSignUpPage < Page

  def fill_in_account_information(user_info)
    fill_in 'qa-sign-up-email', with: user_info.email
    fill_in 'qa-sign-up-password', with: user_info.password
    fill_in 'qa-sign-up-pword-confirmation', with: user_info.password_confirmation
  end

  def submit
    click_button 'qa-sign-up'
  end

  def logout
    click_link 'qa-log-out'
  end
end
