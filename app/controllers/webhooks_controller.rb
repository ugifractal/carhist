class WebhooksController < ApplicationController
  protect_from_forgery except: :midtrans
  # https://dashboard.sandbox.midtrans.com/settings/payment/notification
  def midtrans
    hash = JSON.parse(request.body.read)

    concatenated = "#{hash['order_id']}#{hash['status_code']}#{hash['gross_amount']}#{ENV.fetch('MIDTRANS_SERVER_KEY')}"
    signature = Digest::SHA2.new(512).hexdigest(concatenated)
    unless signature == hash["signature_key"]
      render plain: "invalid signature", status: :unprocessable_entity
      return
    end

    order_id = hash["order_id"]
    payment_type = hash["payment_type"]
    transaction_status = hash["transaction_status"]
    fraud_status = hash["fraud_status"]

    case transaction_status
    when "settlement"
      order = Order.where(id: order_id, status: "pending").first
      order&.upgrade!
    when "cancel"
      order = Order.where(id: order_id, status: "pending").first
      order&.cancel!
    end
    render plain: "ok", status: :ok
  end
end
