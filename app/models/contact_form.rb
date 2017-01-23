class ContactForm < MailForm::Base
  # extend ActiveModel::Naming
  # include ActiveModel::Conversion

  # append :remote_ip, :user_agent, :session


  attribute :first_name,      :validate => true
  attribute :last_name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  # attribute :file,      :attachment => true

  attribute :message
  # attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contact Form",
      :to => "contact@tefecho.com",
      :from => %("#{first_name} #{last_name}" <#{email}>)
    }
  end

  # def persisted?
  #   false
  # end
end
