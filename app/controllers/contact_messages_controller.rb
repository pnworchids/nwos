class ContactMessagesController < ApplicationController
  def create
    @message = ContactMessage.new(message_params)
    if @message.valid?
      # TODO send message here
      render "success"
    else
      render "pages/contact"
    end
  end

  private

    def message_params
      params.require(:contact_message).permit(:to, :name, :email, :phone, :subject, :body)
    end
end