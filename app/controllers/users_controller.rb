class UsersController < ApplicationController
    get '/home' do
        redirect to '/notebooks'
    end

    get '/signup' do
        if !logged_in?
            erb :'sessions/signup'
        else
            redirect to '/notebooks'
        end
    end

    post '/signup' do
        user_emails = User.all.collect {|user| user.email}
        usernames = User.all.collect {|user| user.username}

        if user_emails.include?(params[:email]) || usernames.include?(params[:username]) || params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.create(username: params[:username], email: params[:email], password: params[:password])
            session[:user_id] = @user.id
            redirect to '/notebooks'
        end
    end
 
    get '/login' do
        if logged_in?
            redirect to '/notebooks'
        else
            erb :'sessions/login'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/notebooks'
        else
            redirect to '/login'
        end
    end
=begin   

    get '/logout' do
        session.clear
        redirect "/login"
    end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end
=end
end