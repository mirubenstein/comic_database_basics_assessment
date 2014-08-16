require 'rspec'
require 'pg'
require 'pry'
require 'comic'
require 'character'

DB = PG.connect({:dbname => 'comic_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM comics *;")
    DB.exec("DELETE FROM characters *;")
  end
end

