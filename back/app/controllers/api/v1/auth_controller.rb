module Api
  module V1
    class AuthController < ApplicationController
      before_action :authenticate_user, only: [:login]

      def login
        render json: {status: 200, user: response_fields(current_user.to_json) }
      end

      def create
      end

      def logout
        render json: {status: 200}
      end

      private
      def login_params
        params.permit(:name, :email)
      end

      def response_fields(user_json)
        user_parse = JSON.parse(user_json)
        user_parse.except('created_at', 'updated_at', 'password', 'password_digest')
      end

    end
  end
end
