require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  # configure :development do
  #   register Sinatra::Reloader
  # end
  
  post '/sort-names' do
    name = params[:names]
    return name.split(",").sort.join(",")
  end
end











# ROUTES is a way to associate a REQUEST method and PATH to a block of credit cards that needs executing?

# FOR EXAMPLE ROUTE:
# GET /   -> execute some code
# GET /todos/1    -> execute some different piece of code
# POST /todos/1    -> execute some different code

# We write and configure these routes as part of our APPLICATION CLASS.
# When SINATRA runs as a web server it continuously runs the background and listens for INCOMING HTTP REQUESTS from clients 
# and then when it RECEIVES the REQUEST - it's going to look at the routing table from top to bottom and look for the route that matches INCOMING HTTP REQUEST.

# GET / EXAMPLE
  # Root path (homepage, index page)
  # get '/' do
  #   return 'Hello!'
  # end

  # EXAMPLE
  # get '/posts' do
  #   name = params[:name]
  #   cohort_name = params[:cohort_name]

  #   p name
  #   p cohort_name
  #   return "Hello #{name}, you're in the cohort #{cohort_name}"
  # end

  # post '/posts' do
  #   title = params[:title]

  #   return "Post was created with title: #{title}"
  # end



  # 02_Exercise
  # get '/hello' do
  #   name = params[:name]
  #   return "Hello #{name}"
  # end



  # 02_Challenge
  # post '/submit' do
  #   name = params[:name]
  #   message= params[:message]
  
  #   p name
  #   p message
  #   return "Thanks #{name}, you sent this message: #{message}"
  # end

 

# 03_EXAMPLE Test-driving a Route
# get '/hello' do
#   name = params[:name]
#   return "Hello #{name}"
# end


# 03_EXERCISE GET /NAMES
# get '/names' do
#   name1 = params[:name1]
#   name2 = params[:name2]
#   name3 = params[:name3]
  
#   return "#{name1}, #{name2}, #{name3}"
# end