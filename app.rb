require 'sinatra'
require  'sinatra/reloader'
require 'active-record'

set :bind, '192.168.33.10'
set :port,  3000

class Contribution<ActiveRecord::Base
	establish_connection(adapter:"splite3",datebase:"./db/bbs.db")
get'/'do
	'Hello Sinatra!'
	erb :index
end
post '/new'do
	"Hello world"
	"名前:#{params[:user_name]},内容:#{params[:body]}"
	Contribution.create(:name => params[:user_name],
						:body => params[:body])	
	redirect '/'
	end									   
end