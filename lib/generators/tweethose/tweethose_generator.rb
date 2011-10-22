require 'rails/generators'
require 'tweethose'
##
# Hooks into the Rails Generator pipeline providing "rails generate tweethose" capabilities.
#

class TweethoseGenerator < Rails::Generators::Base

  self.source_paths << File.join(File.dirname(__FILE__), 'templates')

  desc "This generates the TweetHose daemon script"  

  ##
  # Creates the TweetHose daemon script
  #
  def create_script_file
    template 'control', 'script/tweethose_ctl'
    chmod 'script/tweethose_ctl', 0755
    template 'script', 'script/tweethose'
    chmod 'script/tweethose', 0755
  end

  ##
  # Creates the TweetHose daemon configuration file
  #
  def create_configuration_file
    template 'config', 'config/tweethose.yaml'
  end

  ##
  # Creates the TweetHose initializer, ie. the configuration file
  #
  def create_initializer
   template 'initializer', 'config/initializers/tweethose.rb'
  end
end
