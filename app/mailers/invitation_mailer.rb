class InvitationMailer < ApplicationMailer
  
  def invite_email(email)
    @url = new_user_url
    mail(to: email, subject: "Yondaアプリへの招待が届きました!")
  end
end
