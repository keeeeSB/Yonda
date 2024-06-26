class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = t(".success")
      redirect_to root_path
    else
      flash.now[:danger] = t(".failure")
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
