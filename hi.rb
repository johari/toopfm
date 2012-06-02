require 'sinatra'
require 'sinatra/streaming'
require 'yaml'
require 'active_support/all'
require 'json'

get '/' do
  erb :hello_world
end

post '/find' do
  redirect to("/show/%s" % params[:artist])
end

get '/:do/:artist/?' do
  halt 400, "bad request" if not ["txt", "show", "json"].include? params[:do]

  config = YAML.load_file "config.yml"
  api_key, api_secret = config["api_key"], config["api_secret"]

  require 'scrobbler'
  artist = Scrobbler::Artist.new(params[:artist])
  @tracks = artist.top_tracks
  @artist = artist.name
  halt 404, "artist not found!" if @tracks.length == 0

  case params[:do]
  when "txt"
    content_type "text/plain"
    out = ""
    res = @tracks.each do |track|
      out << track.name << "\n"
    end
    require 'htmlentities'
    coder = HTMLEntities.new
    string = "&eacute;lan"
    coder.decode(out)
  when "json"
    @tracks.collect { |t| t.name }.to_json
  when "show"
    erb :top_tracks
  end
end

get '/suggest' do
  require 'uri'
  require 'net/http'
  key = URI.encode(params[:key] << " last.fm")
  resp = Net::HTTP.get("google.com",
                       "/complete/search?q=#{key}&client=firefox")
  result = JSON.parse(resp)
  alts = result[1]
  alts.collect { |x| x.gsub /\ ?last[. ]?fm/, "" }.to_json
end
