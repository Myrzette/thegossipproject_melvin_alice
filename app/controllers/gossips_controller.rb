class GossipsController < ApplicationController
  before_action :authenticate_user

  def show
    @gossip = Gossip.find(params[:id])
    @u = @gossip.user
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new( 'title' => params[:title],
                          'content' => params[:content],
                          'user_id'  => session[:user_id])

    if @gossip.save # essaie de sauvegarder en base @gossip
      flash.notice = "Gossip successfully created"
      redirect_to root_path
    else
      flash.alert = "Can not be created"
      render 'new'
      flash.alert = nil
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])      
  end

  def update
    @gossip = Gossip.find(params[:id])

    gossip_params = params.require(:gossip).permit(:title, :content)

    if @gossip.update(gossip_params)
      flash.notice = "Gossip successfully edited"
      redirect_to root_path
    else
      flash.alert = "Can not be created"
      render :edit
      flash.alert = nil
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  private

  def authenticate_user
    unless helpers.current_user
      flash.alert = "You must bu logged in to access this section"
      redirect_to new_session_path
    end
  end

end
