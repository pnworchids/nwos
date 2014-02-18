class ApplicationMailer < ActionMailer::Base
  def contact_form_message(message)
    @message = message
    mail :subject => @message.subject,
         :to      => @message.to,
         :from    => "#{@message.name} <#{@message.email}>"
  end
end