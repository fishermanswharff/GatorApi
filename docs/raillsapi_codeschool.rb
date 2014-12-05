=begin


=======================================

      SURVIVING APIS WITH RAILS

=======================================




# ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
# REST, routes, constraints and namespaces
# ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±


lets take a look at how a service looks from the eyes of the end user

client creates a playlist (create command, params)
response from server => ok, playlist created

read /playlists/13
server says ok, here's params

FOUNDATION OF RESTful APIs
———————————————————————————————————————
set of commands 
performed on things 
generates responses

REpresentational State Transfer:
by following a strict set of operations, REST allows building an infrastructure that can support different types of applications

Routes are a good starting point for implementing our API

/config/routes.rb: 
$ rake routes

=end


# =========================================
#               RECAP
# =========================================

# ROUTES
# ———————————————————————————————————————

# this restricts actions
resources :zombies, except: :destroy 

# only allows the index action
resources :zombies, only: :index

# except: and only: take arrays of parameters as well:
resources :zombies, only: [:index, :show]
resources :zombies, except: [:destroy, :edit, :update]

# ———————————————————————————————————————

# with_options
# with_options is an elegant way to factor duplication out of options passed to a series of method calls

with_option only: :index do |list_only|
  list_only.resources :zombies
  list_only.resources :humans
  list_only.resources :medical_kits
end

# ———————————————————————————————————————

# Using Constraints To Enforce Subdomain
# keeping our api under its own subdomain allows load balancing traffic at the DNS level, which is much more efficient that at the application level

resources :episodes #=> available at http://cs-zombies.com/episodes

constraints subdomain: 'api' do
  resources :zombies #=> available at http://api.cs-zombies.com/zombies
  resources :humans #=> available at http://api.cs-zombies.com/humans
end


# ———————————————————————————————————————

# Using subdomains in development
# network configuration for supporting subdomains in development: 

# /etc/hosts:
# 127.0.0.1 cs-zombies-dev.com
# 127.0.0.1 api.cs-zombies-dev.com

# append '-dev' to the url you're using for development
# the following urls are now available on our machine: 

# http://cs-zombies-dev.com:3000
# http://api.cs-zombies-dev.com:3000

# ———————————————————————————————————————

# keeping web and api controllers organized:
# create a separate namespace only for controllers. 
# it's good practice to keep web controller separate from api controllers

# config/routes.rb

constraints subdomain: 'api' do
  namespace :api do
    resources :zombies #=> controlled with an api controller
  end  
end

resources :pages #=>controlled with a web controller

# app/controllers/api/zombies_controller.rb:
# web api controllers are part of the API module

module Api
  class ZombiesController < ApplicationController
  end
end

# app/controllers/pages_controller.rb
# remains on top level namespace

class PagesController < ApplicationController 
end

# ———————————————————————————————————————

# Removing duplication from the url
constraints subdomain: 'api' do
  namespace :api do
    resources :zombies 
  end  
end

# results in the uri:
# http://api.cs-zombies.com/api/zombies
# note the 'api' duplication

# we can fix this by passing in a path option into the namespace, path: '/'
constraints subdomain: 'api' do
  namespace :api, path: '/' do
    resources :zombies 
  end  
end

# http://api.cs-zombies.com/zombies

# ———————————————————————————————————————

# We can use a shorter syntax by passing contstraints into the namespace method:
namespace :api, path: '/', constraints: { subdomain: 'api' } do
  resources :zombies
  resources :humans
end


# ———————————————————————————————————————

# API Case Consistency
# when we wrote our API controller we wrote the name in camel case, the ruby way for writing class names. "Api"

# config/initializers/inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
end

# app/controllers/api/zombies_controller.rb
module API
  class ZombiesController < ApplicationController
  end
end





# =========================================
#             Resources & GET
# =========================================

# REST is all about the resources. Anything that can be given a name can be a resource

# "A resource is a conceptual mapping to a set of entities, not the entity that corresponds to the mapping at any particular point in time."
  # —Steve Klabnick, Designing Hypermedia APIs

# ———————————————————————————————————————

# GET Method

=begin

the GET method is used to read information identified by a given URI
2 important characteristics—
it's safe, it should not take any action other than retrieval.
Idempotent - sequential GET requests to the same URI should not generate side effects

The best way to understand how the GET method works in rails is by writing tests. Integration tests simulate how clients will interact with the server.

=end


# config/routes.rb
namespace :api, path: '/', constraints: { subdomain: 'api' } do
  resources :zombies
  resources :humans
end

# test/integration/listing_zombies_test.rb
require 'test_helper'

class ListingZombies < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' } #=> host! method required for testing on subdomains

  test 'returns list of all zombies'  do 
    get '/zombies'
    assert_equal 200, response.status #=> means that the request has succeeded. 
  end
  # 200 response should include the resource in the response body
end


# ———————————————————————————————————————

# Listing Resources

# app/controllers/api/zombies_controller.rb
module API
  class ZombiesController <  ApplicationController
    def index
      zombies = Zombie.all
      render json: zombies #=> serializes all the properties to JSON
    end
  end
end

=begin
# zombies.to_json =>
[ 
  {"id": 5,"name": "Joanna", "age":null, "weapon":"axe",......},
  {"id": 6, "name": "John", "age":null,....}
]
=end

# by default rails returns a 200 response to render. We can be more explicit with passing in the status as the second param on the render call:
module API
  class ZombiesController <  ApplicationController
    def index
      zombies = Zombie.all
      render json: zombies, status: 200
    end
  end
end

# ———————————————————————————————————————

# Path Segmented Expansion: arguments in the url are separated with a '/'
"/zombies"
'/zombies/:id'
'/zombies/:id/victims'
'/zombies/:id/victims/:id'

'/zombies?id=1' #=> this routes to Zombies#index and not to to Zombies#show


# Most Uri Will Not Depend On Query Strings, sometimes it's ok to use query strings on URIs.

# Filters:
"/zombies?weapon=axe"

# Searches
'/zombies?keyword=john'

# Pagination
'zombies?page=2&per_page=25'

# ———————————————————————————————————————

# Test Listing Resources with query strings

# test/integration/listing_zombies_test.rb
class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'return zombies filtered by weapon' do
    john = Zombie.create!(name: 'John', weapon: 'axe')
    joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')

    get '/zombies?weapon=axe'
    assert_equal 200, response.status

    zombies = JSON.parse(response.body, symbolize_names:true)
    names = zombies.collect { |z| z[:name] }
    assert_includes names, 'John'
    refute_includes names, 'Joanna'
  end
end

# app/controllers/api/zombies_controller.rb

module API
  class ZombiesController < ApplicationController
    def index 
      zombies = Zombie.all #=> in Rails 4 this returns a chainable scope
      if weapon = params[:weapon]
        zombies = zombies.where(weapon: weapon) #=> we can add filters dynamically
      end
      render json: zombies, status: 200
    end
  end
end


# ———————————————————————————————————————

# Test Retrieving one zombie

# test/integration
class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test '' do
    joanna = Zombie.create!(name: 'Joanna', weapon: 'axe')

    get "/zombies/#{zombie.id}" #=> routes to Zombies#show
    assert_equal 200, response.status

    zombie_response = JSON.parse(response.body, symbolize_names:true)
    assert_equal zombie.name, zombie_response[:name]
  end
end

# app/controllers/api/zombies_controller.rb

module API
  class ZombiesController < ApplicationController
    
    def index 
      zombies = Zombie.all #=> in Rails 4 this returns a chainable scope
      if weapon = params[:weapon]
        zombies = zombies.where(weapon: weapon) #=> we can add filters dynamically
      end
      render json: zombies, status: 200
    end

    def show
      zombie = Zombie.find(params[:id])
      render json: zombie, status: 200
    end
  end
end

# http://guides.rubyonrails.org/layouts_and_rendering.html


# ———————————————————————————————————————
# Getting rid of duplication
# We're using 'symbolize_names: true' across all of our test classes, so we're going to extract that out to it's own helper method

class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test '' do
    joanna = Zombie.create!(name: 'Joanna', weapon: 'axe')

    get "/zombies/#{zombie.id}" #=> routes to Zombies#show
    assert_equal 200, response.status

    # zombie_response = JSON.parse(response.body, symbolize_names:true)
    zombie_response = json(response.body)
    assert_equal zombie.name, zombie_response[:name]
  end
end

# test/test_helper.rb

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  # can be used across all tests
  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end


# ———————————————————————————————————————

# Using CURL to test our api with real network requests
# curl is a command line tool that issues real HTTP requess over the network

# $ curl http://api.cs-zombies-dev.com:3000/zombies

# defaults to a GET request to that url
# displays the response body on the terminal

# Using curl with options
# works with query strings too

# $ curl http://api.cs-zombies-dev.com:3000/zombies?weapon=axe

# to view the response headers, pass in '-I' on the curl request
# $ curl -I http://api.cs-zombies-dev.com:3000/zombies/7




# =========================================
#             Content Negotiation
# =========================================

=begin
your api needs to be able to respond to different types of formats. 
rails gives us a nice way give the responses back in different formats by changing the uri extension
the proper way to request specific formats is to use the accept pattern. 
=end

class ListingZombiesText < ActionDispatch::IntegrationTest
  test 'returns zombies in JSON ' do
    get '/zombies', {}, {'Accept' => Mime::JSON}
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end  

  test 'returns zombies in XML' do 
    get '/zombies', {}, {'Accept' => Mime::XML}
    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
  end
end


# zombies controller 
# app/controllers/zombies_controller.rb

class ZombiesController < ApplicationController
  def index
    zombies = Zombie.all
    respond_to do |format|
      format.json { render json: zombies, status: 200 }
      format.xml { render xml: zombies, status: 200 }
    end
  end
end

# checking response headers is super useful when debugging
# ———————————————————————————————————————
# HTTP/1.1 200 OK
# Content-Type: application/json #=> 


# Rails ships with 21 different media types to respond to. 
# ———————————————————————————————————————
# $ Mime::SET #=> fire up rails console in terminal to list all the supported media types
# Mime::SET.collect(&:to_s) is a prettified version of this Mime types supported by rails


# You can also use curl to query your api
# ———————————————————————————————————————
# $ curl -IH "Accept: application/json" localhost:3000/zombies

# send custom request headers with the -H option

# => 
# HTTP/1.1 200 OK
# Content-Type: application/json; charset-utf-8


# Content Negotiation: working with languages
# ========================================================

# Use the Accept-Language request header for language negotiation
# test/integration/changing_locales_test.rb

class ChangingLocalesTest < ActionDispatch::IntegrationTest
  test 'returns list of zombies in english' do
    get'/zombies', {}, { 'Accept-Language' => 'en', 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    zombies = json(response.body)
    assert_equal "Watch out for #{zombies[0][:name]}!", zombies[0][:message]
  end
end

# portugese
class ChangingLocalesTest < ActionDispatch::IntegrationTest
  test 'returns list of zombies in english' do
    get'/zombies', {}, { 'Accept-Language' => 'pt-BR', 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    zombies = json(response.body)
    assert_equal "Cuidado com #{zombies[0][:name]}!", zombies[0][:message]
  end
end

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  protected
    def set_locale
      I18n.locale = request.headers['Accept-Language'] #=> returns language accepted by client
    end
end






# =========================================
#        Post, Put, Patch, Delete
# =========================================
=begin
Post Method
the post method is used for creating resources on the server. 

the post method is neither safe nor idempotent

the status code for the response should be 201 - Created
the response body should contain a respresentation of the new resource
the location header should be set with the location of the new resource

=end


# RESPONDING TO A SUCCESSFUL POST REQUEST
# ———————————————————————————————————————
# integration testing the post method
# test/integration/creating_episodes_test.rb

class CreatingEpisodesTest < ActionDispatch::IntegrationTest
  test 'creates episodes' do 
    post '/episodes',
     { episode: 
        { title: 'Bananas', description: 'Learn about bananas' }
     }.to_json,
     { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

     assert_equal 201, response.status
     assert_equal Mime::JSON, response.content_type

     episode = json(response.body)
     assert_equal episode_url(episode[:id]), response.location
  end
end

# use the location option on render to send back the resources' full url
# app/controllers/episodes_controller.rb

class EpisodesController < ApplicationController
  def create
    episode = Episode.new(episode_params)
    if episode.save
      render json: episode, status: 201, location: episode
    end
  end

  private
  def episode_params
    params.require(:episode).permit(:title, :description)
  end
end


# POSTING DATA WITH CURL
# ———————————————————————————————————————
# curl can help detect errors not caught by tests

# -i means we want to see response headers.
# -X option specifies method
# -d command to send data on the request
# $ curl -i -X POST -d 'episode[title]=ZombieApocalypseNow' http://localhost:3000/episodes

curl -i -X POST -d 'line_item[product_id]=1' http://localhost:3000/line_items

# HTTP/1.1 422 Unprocessable Entity
# Content-Type text/html; charset=utf-8

# rails checks for an authenticity token on any method that's not get.
# this is to prevent cross site forgery attacks
# you can change this on the application controller with:
protect_from_forgery with: :null_session

# SUCCESSFUL RESPONSES WITH NO CONTENT
# ———————————————————————————————————————
# app/controllers/episodes_controller.rb
# ajax responses can be made alot faster with no response body.

# app/controllers/episodes_controller.rb

class EpisodesController < ApplicationController
  
  def create
    episode = Episode.new(episode_params)
    if episode.save
      render nothing: true, status: 204, location: episode
      # 204 response means the server has fulfilled the request but does not need to return an entity body

      # you can also use the head method
      head 204, location: episode

      # the head method takes arguments too:
      head :no_content
    end
  end
end


# TESTING UNSUCCESSFUL POST REQUESTS
# ———————————————————————————————————————
# when a client sends a post request and the server is not able to understand

# test/integration/creating_episodes_test.rb

class CreatingEpisodesText < ActionDispatch::IntegrationTest

  test 'does not create episodes with title nil' do
    post '/episodes',
      { episode:
        { title: nil, description: 'Learn about bananas.' }
      }.to_json
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

      assert_equal 422, response.status
      assert_equal Mime::JSON, response.content_type
      # status code 422 means there was an error and the client was to blame
  end
end


# RESPONDING TO UNSUCCESSFUL POST REQUESTS
# ———————————————————————————————————————
# use the 422 status code when creating a new resource is not succesful
# app/models/episode.rb

class Episode < ActiveRecord::Base
  validates :title, presence: true
end

# app/controllers/episodes_controller.rb

class EpisodesController < ApplicationController
  def create
    episode = Episode.new(episode_params)
    if episode.save
      render json: episode, status: :created, location: episode
    else
      render json: episode.errors, status: 422 #=> episode.errors helps clients figure out the cause of the error
    end
  end
end

# UNDERSTANDING INTERNAL SERVER ERRORS
# ———————————————————————————————————————
# Rails auto handles server errors and returns a 500 response.
# caused by some unexpected behavior on the server.
# 500 status code means the server experienced a condition that prevented it from handling the request.






# =========================================
#               Put, Patch
# =========================================

# according the HTTP spec, the PUT method requests that the enclosed entity be stored under the supplied Request-URI
# we're supposed to send along the resource 
# Rails 4 implemented support for the PATCH method, and PATCH and PUT are both routed to the same action on the resource.
# use the patch helper method on integration tests

# test/integration/updating_episodes_test.rb

class UpdatingEpisodesText < ActionDispatch::IntegrationTest
  setup { @episode = Episode.create!(title: 'First Title') }

  test 'successful update' do
    patch "/episodes/#{@episode.id}",
    {episode: {title: 'First Title edit'}}.to_json, 
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 200, response.status
    assert_equal 'First Title Edit', @episode.reload.title
  end
end

# the update method only updates values that differ from the existing record
# app/controllers/episodes_controller.rb

class EpisodesController < ApplicationController

  def update
    episode = Episode.find(params[:id])
    if episode.update(episode_params)
      render json: episode, status: 200
    end
  end

  private
  def episode_params
    params.require(:episode).permit(:title, :description)
  end
end



# now, lets write a test for an unsuccessful patch request.
class UpdatingEpisodesText < ActionDispatch::IntegrationTest
  setup { @episode = Episode.create!(title: 'First Title') }

  test 'successful update' do
    patch "/episodes/#{@episode.id}",
    {episode: {title: 'short'}}.to_json, 
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
  end
end

# implementation

# app/models/episode.rb

class Episode < ActiveRecord::Base
  validates :title, length: { minimum: 10 }
end

# app/controllers/episodes_controller.rb
class EpisodesController < ApplicationController

  def update
    episode = Episode.find(params[:id])
    if episode.update(episode_params)
      render json: episode, status: 200
    else
      render json: episode.errors, status: 422 # 422 = client submitted bad data
    end
  end

  private
  def episode_params
    params.require(:episode).permit(:title, :description)
  end
end




# =========================================
#                 Delete
# =========================================

# deleting a resource, the client is not interested in this resource anymore.
# test
class DeletingEpisodesText < ActionDispatch::IntegrationTest
  setup { @episode = Episode.create!(title: 'I am going to be deleted') }

  test 'deletes existing episode' do
    delete "/episodes/#{@episode.id}",
    assert_equal 204, response.status # 204 is success, without body
  end
end


# app/controllers/episodes_controller.rb
class EpisodesController < ApplicationController

  def destroy
    episode = Episode.find(params[:id])
    episode.destroy
    head 204
  end

end

# ARCHIVING RESOURCES
# ———————————————————————————————————————
# another way to implement the delete method, we can flag it as archived
# in model, you create a new method called archive.

# app/models/episode.rb
class Episode < ActiveRecord::Base

  def self.find_unarchived(:id)
    find_by!(id: id, archived: false) # returns only unarchived methods
  end

  def archive
    self.archived = true
    self.save # does not destroy, just flags as archived.
  end
end

# app/controllers/episodes_controller.rb
class EpisodesController < ApplicationController

  def destroy
    episode = Episode.find(params[:id])
    episode.archive # does not call destroy
    head 204
  end
end

Episode.find(3)
# returns a header only response, marking the archive as true


# Make sure you update the other methods in the controller
class EpisodesController < ApplicationController

  def index
    episodes = Episode.where(archived: false)
    render json: episodes, status: 200
  end

  def show
    episode = Episode.find_unarchived(params[:id])
    render json: episode, status: 200
  end

  def destroy
    episode = Episode.find(params[:id])
    episode.archive # does not call destroy
    head 204
  end
end



# =========================================
#             Authentication
# =========================================

# authentication is how servers prevent unauthorized access to protected resources
# there are two ways to implement authentication

# BASIC Authentication
# ———————————————————————————————————————

# what the HTTP request header looks like:
GET /episodes HTTP/1.1
Host: localhost:3000
Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQ=

# username: password
# 

# credentials for basic auth are expected to be Base64 encoded.
# if you wanted to test this in your console, you could do something like this:
require 'base64'
# => true
Base64.encode64('foo:secret') # username:password
# => "Zm9vOnNlY3Jlda==\n"

# set up a test
class ListingEpisodesText < ActionDispatch::IntegrationTest
  setup { @user = User.create!(username: 'foo', password: 'secret')}

  test 'valid username and password' do
    get '/episodes', {}, { 'Authorization' => 'Basic Zm9vOnNlY3JldA=='} # base64 encoding
    assert_equal 200, response.status
  end

  test 'missing credentials' do
    get '/episodes', {}, {} #=> no creds, should return a 401 response
    assert_equal 401, response.status #=> 401 means unauthorized status code
  end
end

# Rails has build in support for basic auth.
# app/controllers/episodes_controller.rb
class EpisodesController < ApplicationController

  before_action :authenticate

  def index
    episodes = Episode.where(archived: false)
    render json: episodes, status: 200
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      User.authenticate(username, password)
    end
  end
end





# ADDING A TEST HELPER METHOD TO ENCODE CREDENTIALS
# ———————————————————————————————————————
class ListingEpisodesText < ActionDispatch::IntegrationTest
  setup { @user = User.create!(username: 'foo', password: 'secret')}

  def encode(username, password)
    ActionController::HTTPAuthentication::Basic.encode_credentials(username, password)
  end

  test 'valid username and password' do
    get '/episodes', {}, { 'Authorization' => encode(@user.username, @user.password)} # base64 encoding
    assert_equal 200, response.status
  end
end



# you can take this one step further by moving your encode method to a test helper file, so it can used across all the different tests
# test/test_helper.rb
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::MIgration.check_pending!
  fixtures :all

  def encode_credentials(username, password)
    ActionController::HTTPAuthentication::Basic.encode_credentials(username, password)
  end
end

# then in your test file call:
  ...
  get '/episodes', {}, { 'Authorization' => encode_credentials(@user.username, @user.password)} # base64 encoding
  ...

# UNDERSTANDING UNAUTHORIZED HTTP RESPONSES
# ———————————————————————————————————————
# must include the WWW-Authenticate header

# response header:
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Basic realm="Application"
Content-Type: text/html, charset=utf-8

# The WWW-Authenticate header: 
# => Basic: the given resource uses HTTP Basic Authentication
#    realm="Application" : means resource is part of the Application realm

# Realms allow resources to be partitioned into protection spaces.
# Realms help clients know which username and password to use

authenticate_or_request_with_http_basic("Episodes") do |username, password|
  User.authenticate(username, password)
end

# you can also use curl for authentication requests
# $ curl -Iu 'carlos:secret' http://localhost:3000/episodes

# results in this header:
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

# You can also use this syntax:
# $ curl -I http://carlos:secret@localhost:3000/episodes

# Limitations
# ———————————————————————————————————————
# unauthorized requests using authenticate_or_request_with_http_basic always respond with text/html, which might break some clients.
# you can use authenticate_with_http_basic method which gives us more control over the response.


# app/controllers/episodes_controller.rb
class EpisodesController < ApplicationController

  before_action :authenticate

  def index
    episodes = Episode.where(archived: false)
    render json: episodes, status: 200
  end

  protected
  def authenticate
    authenticate_basic_auth || render_unauthorized
  end

  def authenticate_basic_auth
    authenticate_with_http_basic do |username, password|
      User.authenticate(username, password)
    end
    # returns a boolean, and does not halt the request
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Basic realm="Episodes"'

    respond_to do |format|
      format.json {render json: 'Bad credentials', status: 401}
      format.xml {render xml: 'Bad credentials', status: 401}
    end
  end
end

# Basic Auth is simple, but it's not secure.



# =========================================
#           Token Authentication
# =========================================

# when api clients use a token identifier for making authenticated http requests

=begin
Benefits over basic auth:
  
  more convenience, as we can easily expire or regenerate tokens without affecting the user's account password
  better security if compromised, since vulnerability is limited to api access and not the user's master account
  the ability to have multiple tokens for each user, which they can use to grant access to different api clients
  greater control for each token so different access rules can be implemented

Token auth uses the Authorization header. There is currently a http spec in draft for token authentication.

GET /episodes HTTP/1.1
Host: localhost:3000
Authorization: Token token=`some long string of alphanumeric characters`

API tokens are usually displayed on user profile or settings page. 
=end

# test the api token
# test/integration/listing_episodes_test.rb

class ListingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!
  end

  test 'valid authentication with token' do
    get '/episodes',{},{ 'Authorization' => "Token token=#{@user.auth_token}" }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'invalid authentication' do
    get '/episodes',{},{'Authorization' => @user.auth_token + "fake"}
    assert_equal 401, response.status
  end
end

# GENERATING USER ACCESS TOKEN
# app/models/user.rb
class User < ActiveRecord::Base
  before_create :set_auth_token

  private
  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end
end


# Authenticating requests with Access token
# ———————————————————————————————————————
# rails has build in support for token based authentication

# app/controllers/episodes_controller.rb

class EpisodesController < ApplicationController
  before_action :authenticate

  def index 
    episodes = Episode.all
    render json: episodes, status: 200
  end

  protected
  def authenticate
    # this method reads the token from the request header
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end
end

#  move the generation of a token to a test helper
# test/integration/listing_episodes_test.rb
class ListingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!
  end

  def token_header(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  test 'valid authentication with token' do
    get '/episodes',{},{ 'Authorization' => token_header(@user.auth_token) }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'invalid authentication' do
    get '/episodes',{},{'Authorization' => @user.auth_token + "fake"}
    assert_equal 401, response.status
  end
end


# Using realms for token based auth
# ———————————————————————————————————————
# token based access also use realms to different protection spaces

# You can also use curl for token based auth

# $ curl -IH "Authorization: Token token=`long alphanumeric string`" http://localhost:3000/episodes

# response:
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

# Limitations
# ———————————————————————————————————————
# response is always in text/html
# fix that by replacing auth method with:

# app/controllers/episodes_controller.rb

class EpisodesController < ApplicationController
  before_action :authenticate

  def index 
    episodes = Episode.all
    render json: episodes, status: 200
  end

  protected
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    # returns a boolean
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Episodes"'

    respond_to do |format|
      format.json {render json: 'Bad credentials', status: 401}
      format.xml {render xml: 'Bad credentials', status: 401}
    end
  end
end
