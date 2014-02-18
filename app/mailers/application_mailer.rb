class ApplicationMailer < ActionMailer::Base
  def contact_form_message(message)
    @message = message
    mail :subject => @message.subject,
         :to      => @message.recipient_email,
         :from    => "#{@message.name} <#{@message.email}>"
  end
end