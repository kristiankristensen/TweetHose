module TweetHose

  ##
  # Configures TweetHose
  #
  class Config
    ##
    # Sets the Twitter username
    #
    def self.username=(username)
      @username = username
      end

    ##
    # Gets the username
    #
    def self.username
      @username
    end

    ##
    # Sets the Twitter password
    #
    def self.password=(password)
      @password = password
      end

    ##
    # Gets the password
    #
    def self.password
      @password
    end

    ##
    # Sets the keywords to track from Twitter.
    #
    def self.track_keywords=(array)
      @track_keywords = array
      end

    ##
    # Gets the currently tracked keywords
    #
    def self.track_keywords
      @track_keywords
    end

    ##
    # Block to call when a new tweet arrives. The new tweet will be given as a parameter to the block.
    #
    def self.on_new_tweet &block
      if block_given?
        @on_new_tweet = block
        self
      else
        @on_new_tweet
      end
    end

    ##
    # Block to call when a delete tweet arrives from Twitter. The tweet id to delete will be given as a parameter to the block.
    #
    def self.on_delete_tweet &block
      if block_given?
        @on_delete_tweet = block
        self
      else
        @on_delete_tweet
      end
    end

    ##
    # Block to call when a error is returned from Twitter. The message will be given as a parameter to the block.
    #
    def self.on_error &block
      if block_given?
        @on_error = block
        self
      else
        @on_error
      end
    end
  end
end
