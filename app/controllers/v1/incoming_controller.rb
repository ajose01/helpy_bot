module V1
  class IncomingController < ApplicationController
    def inbound
      puts params
      render json: { status: :success } if process_message
    end

    private

    def process_message
      ProcessMessage.new(extract_params) #send to sidekiq (Pending)
    end

    def extract_params
      @from         = Phony.normalize(params[:From])
      @text         = params[:Body]
      @keywords      = @text.split(' ')
      return {from: @from, keywords: @keywords}
    end

  end
end
