# frozen_string_literal: true
require 'interactors/credentials/send_log_in_request'

module IRacing
  class API
    def initialize

    end

    def log_in(username:, password:)
      SendLogInRequest.new.call(username: username, password: password)
    end

    private

    def send_log_in_request
      @send_log_in_request ||= SendLogInRequest.new
    end
  end
end
