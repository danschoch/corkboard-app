require 'rack-flash'

class UsersController < ApplicationController
    use Rack::Flash
    get '/home' do
        redirect to '/notebooks'
    end

    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to '/notebooks'
        end
    end

    post '/signup' do
        user_emails = User.all.collect {|user| user.email}
        usernames = User.all.collect {|user| user.username}

        if user_emails.include?(params[:email]) || usernames.include?(params[:username]) || params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:password] != params[:confirm_password]
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
            erb :'users/login'
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

    get '/users/:id/edit' do
        if logged_in?
            @user = User.find_by_id(params[:id])
            if @user.id == current_user.id
                erb :'users/edit_user'
            else
                redirect to '/logout'
            end
        else
            redirect to '/login'
        end
    end

    patch '/users/:id' do
        if logged_in?
            @user = User.find_by_id(params[:id])
            if @user.id == current_user.id
                user_emails = User.all.collect {|user| user.email}
                usernames = User.all.collect {|user| user.username}
                if params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:password] != params[:confirm_password]
                    flash[:message] = "Make sure all fields are filled out and that your passwords match."
                    redirect to "/users/#{@user.id}/edit"
                elsif user_emails.include?(params[:email]) && usernames.include?(params[:username])
                    if @user.email == params[:email] && @user.username == params[:username]
                        @user.update(password: params[:password])
                        @user.save
                        flash[:message] = "Profile Updated"
                        redirect to '/notebooks'
                    elsif @user.email != params[:email]
                        flash[:message] = "That Email is taken. Please try again."
                        redirect to "/users/#{@user.id}/edit"
                    elsif @user.username != params[:username]
                        flash[:message] = "That Username is taken. Please try again."
                        redirect to "/users/#{@user.id}/edit"
                    else
                        flash[:message] = "That Username and Email are taken. Please try again."
                        redirect to "/users/#{@user.id}/edit"
                    end
                elsif user_emails.include?(params[:email])
                    if @user.email == params[:email]
                        @user.update(username: params[:username], password: params[:password])
                        @user.save
                        flash[:message] = "Profile Updated"
                        redirect to '/notebooks'
                    else
                        flash[:message] = "That Email is taken. Please try again."
                        redirect to "/users/#{@user.id}/edit"
                    end
                elsif usernames.include?(params[:username])
                    if @user.username = params[:username]
                        @user.update(email: params[:email], password: params[:password])
                        @user.save
                        flash[:message] = "Profile Updated"
                        redirect to '/notebooks'
                    else
                        flash[:message] = "That Username is taken. Please try again."
                        redirect to "/users/#{@user.id}/edit"
                    end
                else
                    @user.update(username: params[:username], email: params[:email], password: params[:password])
                    @user.save
                    flash[:message] = "Profile Updated"
                    redirect to '/notebooks'
                end
            else
                redirect to '/logout'
            end
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        redirect to '/notebooks'
    end

end