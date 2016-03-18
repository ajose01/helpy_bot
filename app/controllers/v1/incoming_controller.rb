module V1
  class IncomingController < ApplicationController
    def inbound
      puts params
      extract_params
      send_reply
      render json: { status: :success }
    end

    private

    def extract_params
      @from         = Phony.normalize(params[:From])
      @text         = params[:Body]
      @keyword      = @text.split(' ').first
    end

    def send_reply
      return unless @from && @keyword
      TwilioMessenger.new(@from, "Got your message :)").send_sms
    end
  end
end
