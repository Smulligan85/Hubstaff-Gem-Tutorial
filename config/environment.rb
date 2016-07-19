# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'hubstaff'
Dotenv.load(".env.local")

# Initialize the Rails application.
Rails.application.initialize!
