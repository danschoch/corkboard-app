class NotebooksController < ApplicationController
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
            if params[:notebook_name] !=""
                @notebook = Notebook.new(name: params[:notebook_name], description: params[:notebook_description])
                current_user.notebooks << @notebook
                @notebook.save
                redirect to "/notebooks/#{@notebook.id}"
            else
                redirect to '/notebooks/new'
            end
        else
            redirect to '/login'
        end
    end

    get '/notebooks/:id' do
        if logged_in?
            @notebook = Notebook.find_by_id(params[:id])
            @notes = Note.all.select {|note| note.notebook_ids.include?(@notebook.id)}
            erb :'notebooks/show'
        else
            redirect to '/login'
        end
    end

    get '/notebooks/:id/edit' do
        if logged_in?
            @notebook = Notebook.find_by_id(params[:id])
            erb :'notebooks/edit'
        else
            redirect to '/login'
        end
    end

    patch '/notebooks/:id' do
        if logged_in?
            if params[:notebook_name] !=""
                @notebook = Notebook.find_by_id(params[:id])
                @notebook.update(name: params[:notebook_name], description: params[:notebook_description])
                @notebook.save
                redirect to "/notebooks/#{@notebook.id}"
            else
                redirect to '/notebooks'
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