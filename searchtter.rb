#!/usr/bin/env ruby
# encoding: utf-8

require 'carrier-pigeon'
require 'twitter'
require 'kconv'

Twitter.configure do |config|
  config.consumer_key       = ''
  config.consumer_secret    = ''
  config.oauth_token        = ''
  config.oauth_token_secret = ''
end 

server  = 'irc.media.kyoto-u.ac.jp:6667'
channel = '#channel'

search_words = [
  "mruby",
  "mod_mruby",
]

word    = search_words[rand(search_words.length)]

r       = Twitter.search(word).results.first
message = r.text.tojis.force_encoding("US-ASCII")
user    = r.user.screen_name  + "tter"

CarrierPigeon.send(
  :uri      => "irc://" + user + "@" + server + "/" + channel,
  :message  => "\x0312" + message,
  :ssl      => false,
  :join     => false
)
