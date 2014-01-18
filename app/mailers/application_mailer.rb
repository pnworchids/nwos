class ApplicationMailer < ActionMailer::Base
  def contact_form_message(message)
    @message = message
    mail :subject => @message.subject,
         :to      => "moncrieffa@gmail.com",
         :from    => "#{@message.name} <#{@message.recipient_email}>"
  end
end