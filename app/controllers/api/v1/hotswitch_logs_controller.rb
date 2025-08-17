module Api
  module V1
    class HotswitchLogsController < DeviceLogsController
      skip_before_action :verify_authenticity_token
      before_action :set_hotswitch_logger

      def create
        log = @hotswitch_logger.hotswitch_logs.new
        log.raw = JSON.parse(hotswitch_log_params[:raw])
        log.save!
      end

      private

      def set_hotswitch_logger
        token = request.headers["token"]
        @hotswitch_logger = Device::HotswitchLogger.find_by!(token:)
      end

      def hotswitch_log_params
        params.expect(hotswitch_log: [ :raw ])
      end
    end
  end
end
