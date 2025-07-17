module MidtransUtil
  class TransactionApi < Midtrans
    class << self
      def create(order)
        conn = Faraday.new(
          url: ENV.fetch("MIDTRANS_BASE_URL"),
          headers: {
            "Content-Type" => "application/json",
            "Authorization" => "Basic #{Base64.encode64(secret_key).strip}:"
          }
        )
        response = conn.post("/snap/v1/transactions") do |req|
          req.body = {
            "transaction_details" => {
              "order_id" => "1",
              "gross_amount" => 5000
            },
            "credit_card" => {
              "secure" => true
            },
            "customer_details" => {
              "first_name" => "test"
            }
          }.to_json
        end
        JSON.parse(response.body)
      end
    end
  end
end
