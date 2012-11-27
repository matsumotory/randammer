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

interest_users = [
  "twitter_user1",
  "twitter_user2",
  "twitter_user3",
]

user    =   interest_users[rand(interest_users.length)]
server  =   'irc.media.kyoto-u.ac.jp:6667'
channel =   '#channel'

CarrierPigeon.send(
  :uri      => "irc://" + user + "tter@" + server + '/' + channel,
  :message  => "\x0312" + Twitter.user_timeline(user).first.text.tosjis,
  :ssl      => false,
  :join     => false
)
