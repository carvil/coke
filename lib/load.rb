require 'faraday'

class Load

  attr_accessor :conn, :tweets_url

  def conn
    @conn ||= Faraday.new(:url => tweets_url) do |faraday|
      faraday.adapter  :net_http
      faraday.response :json
    end
  end

  def config
    @config ||= YAML.load_file("#{Rails.root}/config/tweets.yml")[Rails.env]
  end

  def tweets_url
    @tweets_url ||= config["url"]
  end

  def endpoint
    @endpoint ||= config["endpoint"]
  end

  def load
    response = conn.get(endpoint)
    if response.status == 200
      response.body
    else
      Rails.logger.error "Error loading tweets: #{response.inspect}"
      nil
    end
  rescue Faraday::Error::ConnectionFailed, Faraday::Error::TimeoutError => e
    Rails.logger.error e
    nil
  end

end
