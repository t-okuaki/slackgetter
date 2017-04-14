require 'thor'
require 'slackgetter'
require 'pry'

module Slackgetter
  class CLI < Thor
    desc "time", "get messages"
    def time(channel_name, oldest=nil, latest=nil)
      Slackgetter.configure_token ENV['SLACK_TOKEN']
      oldest ||= (Time.now - 24*60*60).to_s
      latest ||= Time.now.to_s
      messages = Slackgetter.messages(channel_name, oldest, latest)
      puts messages
    end
  end
end
