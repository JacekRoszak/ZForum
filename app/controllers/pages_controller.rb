class PagesController < ApplicationController
  
  def home
    if current_user 
      redirect_to chats_path
    end
  end

  def login
    user = User.find_by(email: params[:current_user])
    if user 
      session[:current_user_id] = user.id
      $navvisibility = ''
      redirect_to chats_path
    else
      redirect_to root_path
    end

  end

  def logout
    session[:current_user_id] = nil
    $navvisibility = 'display: none;'
    redirect_to root_path
  end

  private

    def pages_params
      params.require(:pages).permit(:current_user)
    end



end
