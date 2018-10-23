class UsersController < ApplicationController
    get '/home' do
        redirect to '/notebooks'
    end
end