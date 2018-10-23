class NotesController < ApplicationController
    get '/notes/new' do
        if logged_in?
            erb :'/notes/new_note'
        else
            redirect to '/login'
        end
    end

    post '/notes/new' do
        if logged_in?
            if params[:note_title] !=""
                @note = Note.new(title: params[:note_title], content: params[:note_content])
                @current_notebook = Notebook.find_by_id(params[:notebook_id])
                @current_notebook.notes<< @note
                @note.save
                redirect to "/notebooks/#{@current_notebook.id}"
            else
                redirect to "/notebooks/#{@current_notebook.id}"
            end
        else
            redirect to '/login'
        end
    end

    get '/notes/:id/edit' do
        if logged_in?
            @note = Note.find_by_id(params[:id])
            erb :'notes/edit_note'
        else
            redirect to '/login'
        end
    end

    patch '/notes/:id' do
        if logged_in?
            if params[:note_title] !=""
                @note = Note.find_by_id(params[:id])
                @current_notebook = Notebook.find_by_id(params[:notebook_id])

                @note.update(title: params[:note_title], content: params[:note_content])
                @current_notebook.notes<< @note if !@current_notebook.notes.include?(@note)

                @note.save
                redirect to "/notebooks/#{@current_notebook.id}"
            else
                redirect to '/notebooks'
            end
        else
            redirect to '/login'
        end
    end

    delete '/notes/:id/delete' do
        if logged_in?
            @note = Note.find_by_id(params[:id])
            @current_notebook = Notebook.find_by_id(@note.notebook_id)
            if @note #&& current_user.notebooks.include?(@current_notebook)
                @note.delete
                redirect to "/notebooks/#{@current_notebook.id}"
            else
                redirect to '/notebooks'
            end
        else
            redirect to '/login'
        end
    end
end