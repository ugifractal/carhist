class OrdersController < ApplicationController
  before_action :get_company

  def new
    @order = @company.orders.where(status: "pending").order(created_at: :desc).last
    if @order
      redirect_to(@order.midtrans_redirect_url, allow_other_host: true)
      return
    end
    @order = @company.orders.new(price: Order::ORDER_PRICE)
  end

  def create
    @order = @company.orders.new(price: Order::ORDER_PRICE)
    begin
      ActiveRecord::Base.transaction do
        require 'byebug';debugger
        @order.save
        MidtransUtil::Midtrans.setup(secret_key: ENV.fetch("MIDTRANS_SERVER_KEY"))
        response = MidtransUtil::TransactionApi.create(@order)
        if response["error_messages"].present?
          raise CarhistError::GeneralError.new(response["error_messages"].first)
        end
        #require 'byebug';debugger
        @order.update!(midtrans_redirect_url: response["redirect_url"])
        redirect_to(@order.midtrans_redirect_url , allow_other_host: true)
      end
    rescue CarhistError::GeneralError => e
      flash[:error] = e.message
      redirect_to dashboards_path
    end
  end

  def cancel
    @order = @company.orders.find(params[:id])
    @order.update!(status: "canceled")
    redirect_to dashboards_path
  end

  private

  def get_company
    @company = current_user.company
  end

  def order_params
    params.require(:order).permit()
  end
end
