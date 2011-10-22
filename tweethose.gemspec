$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tweethose/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tweethose"
  s.version     = Tweethose::VERSION
  s.authors     = ["Kristian Kristensen"]
  s.email       = ["kristian@whizit.dk"]
  s.homepage    = "http://github.com/kristiankristensen/TweetHose"
  s.summary     = "TweetHose, tap into the Twitter Firehose"
  s.description = "TweetHose lets you easily generate a daemon that listens to the Twitter firehose. When keywords you're interested in appears, you can set up a callback. Should make it easy to create that Justin Bieber tracking app you've always wanted."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency "tweetstream"

  s.add_development_dependency "sqlite3"
end
