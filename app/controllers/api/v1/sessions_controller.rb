module Api
  module V1
    class SessionsController < ApplicationController
      def new
      end

      def create
        email = params[:session][:email]
        password = [:session][:password]
        
        if login(email, password)
          render json: {
            message: "ログインに成功しました"
          }, status: :ok
        else 
          render json: {
            message: "ログインに失敗しました"
          }, status: 401
        end
      end

      private
      def login(email, password)
        user = User.find_by(email: email)

        return false unless user && user.authenticate(password)

        session[:user_id] = user.id
        return true
      end

    end
  end
end