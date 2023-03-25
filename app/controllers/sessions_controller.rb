class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username] )

      if(user && user.authenticate(params[:password]))
        session[:user_id] = user.id
        render json: { status: :created, loggedin: true, user: user}

      else
        render json: {errors: ["Wrong username or password"]}, status: :unauthorized
      end
    end

    #logout
    def destroy
        if current_user
            session.delete(:user_id)
            head :no_content
         else
            render json: { errors: ["You are not logged in"] }, status: :unauthorized
        end
    end

    # Private methods
    private

    def current_user
         @current_user ||= User.find_by(id: session[:user_id])
    end
end
