class UserMailer < ActionMailer::Base
  def forgot_password(user)
    @user = user
    mail(to: @user.email, from: 'registersteam@digital.cabinet-office.gov.uk', subject: 'Password reset')
  end
end
