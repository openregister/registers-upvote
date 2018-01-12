class RegisterMailer < ActionMailer::Base
  def suggest_register(register)
    @register = register
    mail(to: 'registersteam@digital.cabinet-office.gov.uk', from: @register.votes.first.email, subject: 'Register suggestion')
  end
end
