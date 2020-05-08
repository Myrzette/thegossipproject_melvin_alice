class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new( 'first_name' => params[:first_name],
                        'last_name' => params[:last_name],
                        'age' => params[:age],
                        'city_id' => City.all.sample.id , 
                        'email' => params[:email],
                        'password' => params[:password]
                        )
        if @user.save # essaie de sauvegarder en base @user
          flash.notice = "User successfully created"
          redirect_to root_path
        else
          flash.alert = "User can not be registred"
          render 'new'
          flash.alert = nil
        end
      end
  end
  
  def show
    @u = User.find(params[:id])
  end
end
