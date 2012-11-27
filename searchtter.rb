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

words = [
  "mruby",
  "mod_mruby",
]

word    = words[rand(words.length)]

r       = Twitter.search(word).results.first
message = r.text.tosjis
user    = r.user.screen_name  + "tter"

CarrierPigeon.send(
  :uri      => "irc://" + user + "@" server + "/" + channel,
  :message  => "\x0312" + message,
  :ssl      => false,
  :join     => false
)
