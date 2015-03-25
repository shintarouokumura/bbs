require 'sinatra'
require  'sinatra/reloader'
require 'active_record'

#set :bind, '192.168.33.10'
#set :port,  3000

require './models/contributions.rb'

get '/' do
  @contents = Contribution.order("id desc").all
	erb :index
end
post '/new'do
	"Hello world"
	"名前:#{params[:user_name]},内容:#{params[:body]}"
	Contribution.create(:name => params[:user_name],
						:body => params[:body])	
	redirect '/'
										   
end
