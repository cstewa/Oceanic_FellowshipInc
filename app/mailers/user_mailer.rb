class UserMailer < ActionMailer::Base
  default from: "eric.c.mooney@gmail.com"

  def purchase_confirmation(user)
    @user = user

    mail to: user.email, subject: "Your tickets are now purchased. Confirmation number ______"
  end
end
