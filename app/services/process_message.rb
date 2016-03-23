class ProcessMessage
  def initialize(args)
    puts "in process initialize message"
    puts args
    @from = args.fetch(:from)
    @keywords = args.fetch(:keywords)
    process
  end

  def process
    puts "in process"
    send_reply if start_session
  end

  def start_session
    puts @from
    puts @keywords
    puts @keywords.first.downcase
    session[:current_phone] = @from if @keywords.first.downcase == "start"
    puts "session:"
    puts session[:current_phone]
  end

  def send_reply
    TwilioMessenger.new(@from, "Session started! :)").send_sms
  end
end
