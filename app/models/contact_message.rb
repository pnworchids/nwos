class ContactMessage
  include ActiveAttr::Model
  include ActiveModel::ForbiddenAttributesProtection

  attribute :to, :type => String
  attribute :name, :type => String
  attribute :email, :type => String
  attribute :phone, :type => String
  attribute :subject, :type => String
  attribute :body, :type => String

  attr_accessor :to, :name, :email, :phone, :subject, :body

  validates :to, :name, :email, :subject, :body, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :subject, length: {maximum: 78}

  @@contacts = {
    general: { name: "General Inqueries", email: "nwos@nwos.org" },
    newsletter: { name: "Newsletter Editor", email: "newsletter@nwos.org"}, 
    president: { name: "President", email: "president@nwos.org"}, 
    publicity: { name: "Publicity", email: "pubilicy@nwos.org"}, 
    webmaster: { name: "Webmaster", email: "webmaster@nwos.org"}
  }

  def self.recipient_options
    arr = Array.new
    @@contacts.each do |k, v|
      arr << [v[:name], k.to_s]
    end
    return arr
  end

  def recipient_email
    @@contacts[self.to.to_sym][:email]
  end
end