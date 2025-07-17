class OrdersController < ApplicationController
  before_action :get_company

  def new
    @order = @company.orders.new
    @order.price = Order::ORDER_PRICE
  end

  def create
    @order = @company.orders.new
    @order.price = Order::ORDER_PRICE
    ActiveRecord::Base.transaction do
      @order.save
      MidtransUtil::Midtrans.setup(secret_key: ENV.fetch("MIDTRANS_SERVER_KEY"))
      response = MidtransUtil::TransactionApi.create(@order)
      redirect_to response["redirect_url"], allow_other_host: true
    end
  end

  private

  def get_company
    @company = current_user.company
  end

  def order_params
    params.require(:order).permit()
  end
end
