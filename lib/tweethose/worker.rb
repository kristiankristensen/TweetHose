require 'tweetstream'

module TweetHose
##
# The TweetHose worker sets up the tracking with Twitter.
#
# Example usage:
#   require 'yaml'
#   config = YAML.load_file(File.dirname(__FILE__) + "/../config/tweethose.yaml")
#   work = TweetHose::Worker.new(config)
#   work.run
  class Worker
    attr_accessor :config

    ##
    # Params:
    # +config+:: a configuration object with 'username' and 'password' for Twitter
    #
    def initialize(config)
      @config = config
    end

    ##
    # Run the worker.
    #
    def run()
      tell "Running TweetHose"
      configure(@config)
      start_tracking
    end

    private

    def configure(config)
      TweetStream.configure do |c|
        c.username = config['username']
        c.password = config['password']
        c.auth_method = :basic
        c.parser = :yajl
      end
    end

    def start_tracking
      client = TweetStream::Client.new()

      client.on_delete do |status_id, user_id|
        TweetHose::Config.on_delete_tweet.call status_id
      end

      client.on_error do |message|
        TweetHose::Config.on_error.call message
      end

      tell "Drinking form the firehose"

      client.filter(create_params_hash) do |status|
        TweetHose::Config.on_new_tweet.call status
      end
    end

    def create_params_hash
      params = Hash.new
      #TODO: Add ability to follow a user/list of users
      #params[:follow] = follow_users;
      params[:track] = track_keywords
      return params
    end

    def track_keywords
      words = TweetHose::Config.track_keywords
      tell "Tracking the following keywords" + words.join(', ')
      words
    end

    def tell(message)
      log_text = "#{Time.now.strftime('%FT%T%z')}: #{message}"
      #  puts log_text unless config['quiet']
      Rails.logger.add Logger::INFO, log_text if Rails.logger
    end
  end
end
