class NotesController < ApplicationController
    get '/notes/new' do
        if logged_in?
            erb :'/notes/new_note'
        else
            redirect to '/login'
        end
    end

    post '/notes' do
        if logged_in?
            if params[:note_title] !=""
                @note = Note.new(title: params[:note_title], content: params[:note_content])
                @note.notebook_ids = params[:notebooks]
                current_user.notes << @note
                @note.save
                redirect to "/notebooks"
            else
                redirect to "/notebooks"
            end
        else
            redirect to '/login'
        end
    end

    get '/notes/:id/edit' do
        if logged_in?
            @note = Note.find_by_id(params[:id])
            binding.pry
            if @note.user_id == current_user.id
                erb :'notes/edit_note'
            else
                redirect to '/logout'
            end
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
                @note.notebook_ids = params[:notebooks]

                @note.save
                redirect to "/notebooks"
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
            @note_notebook_conn = NoteNotebook.find_by_note(@note.id)
            @current_notebook = Notebook.find_by_id(@note_notebook_conn.notebook_id)
            if @note && @note.notebook_ids.length <= 1 && current_user.notebooks.include?(@current_notebook)
                @note_notebook_conn.delete
                @note.delete
                redirect to "/notebooks/#{@current_notebook.id}"
            elsif @note && @note.notebook_ids.length > 1 && current_user.notebooks.include?(@current_notebook)
                @note_notebook_conn.delete
                redirect to "/notebooks/#{@current_notebook.id}"
            else
                redirect to '/notebooks'
            end
        else
            redirect to '/login'
        end
    end
end