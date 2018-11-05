require 'rack-flash'

class NotebooksController < ApplicationController
    use Rack::Flash
    
    get '/notebooks' do
        if logged_in?
            @user = current_user
            erb :'/notebooks/notebooks'
        else
            redirect to '/login'
        end
    end

    get '/notebooks/new' do
        if logged_in?
            @user = current_user
            erb :'/notebooks/new'
        else
            redirect to '/login'
        end
    end

    post '/notebooks' do
        if logged_in?
            if params[:notebook_name] == ""
                redirect to '/notebooks/new'
            else
                @notebook = Notebook.new(name: params[:notebook_name], description: params[:notebook_description])
                current_user.notebooks << @notebook
                @notebook.save
                redirect to "/notebooks/#{@notebook.id}"
            end
        else
            redirect to '/login'
        end
    end

    get '/notebooks/:id' do
        if logged_in?
            @notebook = Notebook.find_by_id(params[:id])
            if @notebook.user_id == current_user.id
                @notes = Note.all.select {|note| note.notebook_ids.include?(@notebook.id)}
                erb :'notebooks/show'
            else
                redirect to '/logout'
            end
        else
            redirect to '/login'
        end
    end

    get '/notebooks/:id/edit' do
        if logged_in?
            @notebook = Notebook.find_by_id(params[:id])
            if @notebook.user_id == current_user.id
                erb :'notebooks/edit'
            else
                redirect to '/logout'
            end
        else
            redirect to '/login'
        end
    end

    patch '/notebooks/:id' do
        if logged_in?
            if params[:notebook_name] == ""
                redirect to '/notebooks'
            else
                @notebook = Notebook.find_by_id(params[:id])
                if @notebook && @notebook.user == current_user
                    @notebook.update(name: params[:notebook_name], description: params[:notebook_description])
                    @notebook.save
                    redirect to "/notebooks/#{@notebook.id}"
                else
                    redirect to '/notebooks'
                end
            end
        else
            redirect to '/login'
        end
    end

    delete '/notebooks/:id/delete' do
        if logged_in?
            @notebook = Notebook.find_by_id(params[:id])
            if @notebook && @notebook.user == current_user
                @notebook.delete
                redirect to '/notebooks'
            else
                redirect to '/notebooks'
            end
        else
            redirect to '/login'
        end
    end

end