class NotebooksController < ApplicationController
    get '/notebooks' do
        if logged_in?
            @user = current_user
            erb :'/notebooks/notebooks'
        else
            redirect to '/login'
        end
    end
end