require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/test' do
	erb :test
end

post '/visit' do 
	@username = params[:username]
	@phone=params[:phone]
	@datetime=params[:datetime]
	@text=params[:text]

	f = File.open("./public/contacts.txt", 'a')
	f.write "You name #{@username}, you phone #{@phone}, you date #{@datetime}, message #{@text} \n"
	f.close
	erb :visit
end
