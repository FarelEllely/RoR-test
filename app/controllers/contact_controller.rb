class ContactController < ApplicationController
  def index
    @contact = ContactForm.new
  end

  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(params[:contact_form])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank You for your message . We will keep you in touch'
      redirect_to root_path
    else
      flash.now[:error] = 'Could not send message. Retry again !'
      render :index
    end
  end

  private
    # def contact_params
    #   params.require(:contact).permit(:first_name, :last_name, :email, :message)
    # end
end
