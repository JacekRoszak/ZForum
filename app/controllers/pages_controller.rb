class PagesController < ApplicationController
  
  def home
    @res = params[:res]
    if current_user 
      redirect_to chats_path
    end
  end

  def login

    url = 'https://api.zumba.com/api/users/info.json'
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
    data = {
      username: params[:login], 
      password: params[:password], 
      action: "verify_user"
    }
    request.set_form_data(data)
    @res = http.request(request)

    @data = JSON.parse(@res.body)
    if @data['response']
      user = User.find_by(email: params[:login])
      if user 
        session[:current_user_id] = user.id
        redirect_to chats_path
        else
          @user = User.new
          @user.email = params[:login]
          @user.name = @data["response"]['instructor']['instructorFirstName']+" "+@data["response"]['instructor']['instructorLastName']
          @user.admin = false
          @user.superadmin = false
          @user.save
          session[:current_user_id] = @user.id
          redirect_to chats_path
        end
    else
      redirect_to root_path(res: "Twoje dane się nie zgadzają!")
    end


  end

  def logout
    session[:current_user_id] = nil
    $navvisibility = 'display: none;'
    redirect_to root_path
  end

  private

    def pages_params
      params.require(:pages).permit(:login, :password, :res)
    end



end
