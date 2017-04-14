require 'thor'

module Slackgetter
  class CLI < Thor
    desc "hello", "an example task"
    def hello
      puts "hello!!"
    end
  end
end
