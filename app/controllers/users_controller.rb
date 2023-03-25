class UsersController < ApplicationController
    # GET /user/:id
    def show
        if session[:user_id]
            user = User.find(session[:user_id])
            render json: user, status: :ok
        else
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end

    #  POST /user
    def create
        user = User.create(user_params)
        if user.valid?
            render json: { "success": "User saved successfully!"}, status: :created
        else
            render json: {"errors": ["Validation errors"]}, status: :unprocessable_entity
        end
    end


    # Private routes
    private
    def user_params
        params.permit(:username, :password, :last_name, :first_name, :contact, :email, :image_url)
    end
end
