class InvitationMailer < ApplicationMailer
  
  def invite_email(email, inviter)
    @url = new_family_invitation_url(family_id: inviter.family_id)
    @inviter = inviter
    mail(to: email, subject: "Yondaアプリへの招待が届きました!")
  end
end
