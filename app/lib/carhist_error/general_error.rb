module CarhistError
  class GeneralError < StandardError
    def initialize(message = "error")
      super(message)
    end
  end
end
