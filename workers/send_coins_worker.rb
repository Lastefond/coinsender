require 'sidekiq'
require 'net/http'
require 'json'

class SendCoinsWorker
  include Sidekiq::Worker

  def perform(*args)
    uri = URI(ENV['COIN_API_URL'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.instance_of? URI::HTTPS
    req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    req.body = args.first.to_json
    res = http.request(req)
    puts "response #{res.body}"
  rescue => e
      puts "failed #{e}"
      raise e
  end
end
