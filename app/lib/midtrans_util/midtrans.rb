module MidtransUtil
  class Midtrans
    class << self
      @@secret_key = nil

      def setup(secret_key:)
        @@secret_key = secret_key
      end

      def secret_key
        @@secret_key
      end
    end
  end
end
