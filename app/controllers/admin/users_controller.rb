module Admin
    class UsersController < AdminBaseController
      def index
        @users = User.order(email: :asc)
      end
    end
  end
