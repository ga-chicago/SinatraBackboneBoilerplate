require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'instafake'
)

### instafake application!
### final product :)
### we did it guys! yay!

get '/instafake' do
  erb :instafake
end

### exercises

get '/' do
  erb :index
end

get '/1' do
  erb :one
end

get '/2' do
  erb :two
end

get '/3' do
  erb :three
end

get '/4' do
  erb :four
end

get '/5' do
  erb :five
end

get '/6' do
  erb :six
end

get '/7' do
  erb :seven
end

get '/8' do
  erb :eight
end

get '/9' do
  erb :nine
end

get '/10' do
  erb :ten
end


#### RESTFUL API
#### /api/instafake

## get
get '/api/instafake' do
  InstagramModel.all.to_json
end

## get by id
get '/api/instafake/:id' do
  InstagramModel.find(params[:id]).to_json
end

## create
post '/api/instafake' do
  request_body = JSON.parse(request.body.read.to_s)
  InstagramModel.create(request_body).to_json

  # lab time!
  # let's take a look at our request
  #binding.pry
  # stops the execution of our app
  # lets us use the console (Terminal) to interact with this code block

end

## update
put '/api/instafake/:id' do
  request_body = JSON.parse(request.body.read.to_s)
  @id = params[:id]
  @insta = InstagramModel.find(@id)
  @insta.username = request_body[:username]
  @insta.post = request_body[:post]
  @insta.description = request_body[:description]
  @insta.hashtags = request_body[:hashtags]
  @insta.save
  @insta.to_json
end

patch '/api/instafake/:id' do
  request_body = JSON.parse(request.body.read.to_s)
  @id = params[:id]
  @insta = InstagramModel.find(@id)
  @insta.username = request_body[:username]
  @insta.post = request_body[:post]
  @insta.description = request_body[:description]
  @insta.hashtags = request_body[:hashtags]
  @insta.save
  @insta.to_json
end

## delete
delete '/api/instafake/:id' do
  InstagramModel.destroy(params[:id]).to_json
end


### Backbone.js CRUD

get '/crud' do
  erb :crud
end
