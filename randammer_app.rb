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

users = [
  "twitter_user1",
  "twitter_user2",
  "twitter_user3",
]

user    =   users[rand(users.length)]
channel =   '#channel'

CarrierPigeon.send(
  :uri      => "irc://" + user + "tter@irc.media.kyoto-u.ac.jp:6667/" + channel,
  :message  => user + "の最新ツイート: ".tosjis + Twitter.user_timeline(user).first.text.tosjis,
  :ssl      => false,
  :join     => false
)
