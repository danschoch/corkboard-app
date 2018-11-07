require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
	  set :session_secret, "sinatra_secret"
  end

  get '/' do
    if logged_in?
      redirect to '/notebooks'
    else 
      erb :'index'
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect to '/login' if !logged_in?
    end

  end

end