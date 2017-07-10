#!/usr/bin/env ruby
require './paytm/encryption_new_pg.rb'
require './paytm/checksum_tool.rb'
require 'uri'

paytmHASH = { "MID" => ARGV[0], "ORDER_ID" => ARGV[1] }
checksum_hash = ChecksumTool.new.get_checksum_hash(paytmHASH, ARGV[2]).gsub("\n",'')
paytmHASH["CHECKSUMHASH"] =  checksum_hash
puts "#{paytmHASH}"
