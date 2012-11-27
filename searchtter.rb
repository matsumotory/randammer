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

# color code of message
# \x03 + color number
#
# 0 white
# 1 black
# 2 blue (navy)
# 3 green
# 4 red
# 5 brown (maroon)
# 6 purple
# 7 orange (olive)
# 8 yellow
# 9 light green (lime)
# 10 teal (a green/blue cyan)
# 11 light cyan (cyan) (aqua)
# 12 light blue (royal)
# 13 pink (light purple) (fuchsia)
# 14 grey
# 15 light grey (silver)

CarrierPigeon.send(
  :uri      => "irc://" + user + "@" + server + "/" + channel,
  :message  => "\x0312" + message,
  :ssl      => false,
  :join     => false
)
