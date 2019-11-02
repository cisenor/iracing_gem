module IRacing
  class HTTPResponse
    def initialize(input)
      @input = input
    end

    def status
      @input.status
    end
  end
end