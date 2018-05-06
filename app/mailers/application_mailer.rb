class ApplicationMailer < ActionMailer::Base
  
  default from: 'updoc@docasc.com', to: { User.pluck(:email) }
  
  def welcome_email(user)
    @user = user
    # I am overriding the 'to' default
    mail(to: @user.email, subject: 'Do you have any spam?')
  end
end
