namespace :tweethose do
  desc "Clear the TweetHose."
  task :clear => :environment do
    #Delayed::Job.delete_all
  end

  desc "Start a TweetHose worker."
  task :work => :environment do
    #Delayed::Worker.new(:min_priority => ENV['MIN_PRIORITY'], :max_priority => ENV['MAX_PRIORITY'], :queues => (ENV['QUEUES'] || ENV['QUEUE'] || '').split(','), :quiet => false).start
  end
end
