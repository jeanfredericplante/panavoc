require 'yaml'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Load the panavoc config file
APP_CONFIG = YAML::load(File.open("#{::Rails.root.to_s}/config/panavoc_config.yml"))

# Initialize the rails application
Panavoc::Application.initialize!
