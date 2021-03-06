# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Contact < ActiveRecord::Base
  self.table_name = 'salesforce.contact'
end


class Account < ActiveRecord::Base
  self.table_name = 'salesforce.account'
end

get "/accounts" do
  @accounts = Account.all
  erb :accounts
end

get "/contacts" do
  @contacts = Contact.all
  erb :contacts
end

get "/" do
  erb :home
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
