require "./app.rb"

use Rack::MethodOverride

use UsersController
use NotebooksController
use NotesController
run ApplicationController