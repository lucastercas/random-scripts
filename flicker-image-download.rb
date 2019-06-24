#!/usr/bin/env ruby

# Author: Lucas de Macedo
# Github: lucastercas
# In flickr, it is very tiring and boring to download the photos of an artist,
# the whole process taking around 5 or 6 clicks
# This scrit automates that, so all the photos are downloaded to the current
# directory

# TODO: Argument input of number of pages, or number of photos?
# TODO: Directly download the photos to a file? Or put the link in a text file?

require 'rubygems'
require 'nokogiri'
require 'net/http'

def get_content(uri)
  uri = URI(uri)
  page = Net::HTTP.get(uri)
  content = Nokogiri::HTML(page)
  return content
end

def get_photo(author, photo)
  content = get_content("https://www.flickr.com/photos/#{author}/#{photo}/sizes/k/")
  image_src = content.css("#allsizes-photo img").attr('src')
  `curl #{image_src} > #{author}/#{photo}.jpg`
end

def get_photos(author, page)
  content  = get_content("https://www.flickr.com/photos/#{author}/page#{page}")
  content.css('.photo-list-photo-view').each do |photo_list_photo_view|
    style =  photo_list_photo_view.attr('style')
    background_img = style[/url\((.*)\)/,1]
    background_url = background_img[/\.com\/.*\/(.\d+)_/, 1]
    get_photo(author, background_url)
  end
end

print "Starting Downloader\n"

input_array = ARGV
author = input_array[0]
if author then
  Dir.mkdir author
  for i in 1..6
    puts "PAGE: #{i}"
    get_photos(author, i)
  end
else
  puts "Usage: ./flicker-image-download.rb <author_name>\n Ex: ./flicker-image-download.rb megane_wakui"
end
