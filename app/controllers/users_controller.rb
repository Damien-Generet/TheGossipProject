class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
    end

    def new
        @cities = City.all 
        @user = User.new
    end

    def create
        @email = params[:email]
        @cities = City.all
        @first_name = params[:first_name]

        new_password = params[:password]
        confirm_password = params[:confirm_password]
        city = City.find(params[:city])

        @user = User.new(email: @email, city: city, password: new_password, password_confirmation: confirm_password, first_name: @first_name)
        if @user.save
            log_in(@user)
            redirect_to '/home'
        else
            render "#{new_user_path(@user)}"
        end
    end
end
