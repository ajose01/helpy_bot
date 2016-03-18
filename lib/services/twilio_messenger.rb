class TwilioMessenger
  attr_reader :message, :phone

	def initialize(phone, message)
	  @message = message
      @phone = phone
	end

	def send_sms
    twilio_client.account.messages.create({
  		from: from_phone,
  		to:   phone,
  		body: message
		})
	end

	def twilio_client
    account_sid = APP_CONFIG['TWILIO_SID']
    auth_token = APP_CONFIG['TWILIO_AUTH_TOKEN']
	  client ||= Twilio::REST::Client.new(account_sid, auth_token)
	end

	def from_phone
    APP_CONFIG['TWILIO_FROM']
	end

end
