class PagesController < ApplicationController
  def home
  end

  def contact
    @message = ContactMessage.new
  end
end
