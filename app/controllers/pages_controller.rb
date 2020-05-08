class PagesController < ApplicationController

  def home

  end

  def welcome
    @name = params[:name]
  end

  def profile
    @id = params[:user_id]
  end

end
