#!/usr/bin/env ruby
require'open-uri'
require'json'

### REQUIREMENTS ###
# ruby v2.1.4

### USAGE ###
# basic: pass in the app id as an argument
# bulk lookups example below
# for x in `cat appIdList|uniq`; do echo -n "$x,"; ./appleAppIDtoBundle.rb $x; done;
# where appIdList is a text file containing an apple app id, one per line

### CONFIG ###
if ARGV.length < 1
	print"app id: "
	appId = gets.chomp!
else
	appId = ARGV[0]
end

# lookup url
lookupBaseUrl = "https://itunes.apple.com/lookup?id=";

### SCRIPT BODY ###
open(lookupBaseUrl + appId) do |response|
	responseJson = JSON.parse(response.read)
	responseJson['results'].each do |result|
		print result['bundleId']
	end
end
puts
