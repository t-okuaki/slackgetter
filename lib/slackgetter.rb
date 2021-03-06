require "time"
require "slack"
require "slackgetter/version"
require "slackgetter/cli"

module Slackgetter

  def self.configure_token(token)
    Slack.configure do |config|
      config.token = token
    end
  end

  def self.messages(channel_name, oldest, latest)
    channel_id = channel_id(channel_name)
    oldest = Time.parse(oldest)
    latest = Time.parse(latest)

    messages = Slack.channels_history(channel: channel_id, oldest: oldest.to_f, latest: latest.to_f)
    text = text(messages)
    puts text
  end

  def self.url_to_time(url)
    Time.at url.gsub(/.+\/p(.+)\z/){$1}.insert(10, ".").to_f
  end

  def self.channel_id(channel_name)
    channels = Slack.channels_list["channels"]
    channel = channels.select{|channel| channel["name"] == channel_name}
    channel_id = channel.first["id"]
  end

  def self.text(messages)
    if messages["ok"] == true
      text = messages["messages"].map{|message| message["text"]}
      convert(text)
    end
  end

  def self.convert(text)
    text.reverse.join("\n\n").gsub(/\&lt;/, '<').gsub(/\&gt;/, '>')
        .gsub(/<(http[^>]*)>/){ $1 }
        .gsub(/\*([^*]*)\*/){ "*#{$&}*" }
        .gsub(/\~([^~]*)\~/){ "~#{$&}~" }
    # 離れている ~ 同士で ~~ になってしまう
  end

  def self.convert_link_of(text)
    # text.gsub(/<(http[^>]*)>/, '\1')
    text.gsub(/<(http[^>]*)>/){ $1 }
  end

end
