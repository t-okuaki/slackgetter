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

    desc "url", "get messages"
    def url(channel_name, oldest_url, latest_url=nil)
      Slackgetter.configure_token ENV['SLACK_TOKEN']
      oldest = Slackgetter.url_to_time(oldest_url).to_s
      latest = latest_url ? (Slackgetter.url_to_time(latest_url) + 1).to_s : Time.now.to_s
      messages = Slackgetter.messages(channel_name, oldest, latest)
      puts messages
    end
  end
end
