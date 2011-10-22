require 'tweethose'
require 'rails'

module TweetHose
  ##
  # Hoses into Rails
  #
  class Railtie < Rails::Railtie

    ##
    # Add the custom TweetHose Rake tasks
    #
    rake_tasks do
      load 'tweethose/tasks.rb'
    end
  end
end
