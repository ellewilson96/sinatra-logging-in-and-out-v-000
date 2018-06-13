require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    User.find_by(username: params[:username], password: params[:password])
  end

  get '/account' do
    User.create(
      username: params[:username],
      password: params[:password],
      balance: params[:balance])
  end

  get '/logout' do
    @session.clear
  end


end
