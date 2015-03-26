require 'sinatra'
require  'sinatra/reloader' #sinatra/reloderはサーバーを再起動しなくてもよいというプログラム
require 'active_record'

set :bind, '192.168.33.10'
set :port,  3000

class Contribution < ActiveRecord::Base
    establish_connection(adapter: "sqlite3",database: "./db/development.db")
end

require './models/contributions.rb'


get '/i' do
	erb :index2
end

get '/' do
  @contents = Contribution.order("id desc").all
    erb :index #これはindex.rbのファイルを呼び出している。
end
post '/new'do
	"Hello world"
	"名前:#{params[:user_name]},内容:#{params[:body]},LINK:#{params[:link_url]}"
	Contribution.create(:name => params[:user_name],
						:body => params[:body],
                        :link => params[:link_url])
	redirect '/'
end
