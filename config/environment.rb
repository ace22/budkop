# Load the rails application
require File.expand_path('../application', __FILE__)
# Initialize the rails application
BudKop::Application.initialize!
Sass::Plugin.options[:template_location] = { 'app/stylesheets' => 'tmp/stylesheets' }

