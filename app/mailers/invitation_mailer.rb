class InvitationMailer < ApplicationMailer
  
  def invite_email(email, inviter, invite_token)
    @url = new_family_invitation_url(email: email, family_id: inviter.family_id, invite_token: invite_token)
    @inviter = inviter
    mail(to: email, subject: "Yondaアプリへの招待が届きました!")
  end
end
