# require 'json'
#
# file = File.read('test.json')
#
# data_hash = JSON.parse(file)

require 'net/http'
require 'rubygems'
require 'json'
require 'pp'

# json = File.read('test.json')
# obj = JSON.parse(json)
#
# pp obj

require 'yaml'
require 'net/https'
require 'open-uri'
require 'json'

def test
  YAML.load(File.open("yaml.yml")).each do |c,d|
    Thread.start{
      File.new('test.json', "w+").syswrite(Net::HTTP.get(URI.parse(d)))
      puts "#{c}:"
      for i in JSON.parse(File.read('test.json'))
        puts "Key: #{i[0]}"
      end
    }.join
  end
end
test