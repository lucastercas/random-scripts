#!/usr/bin/env ruby

# Author: Lucas de Macedo
# Github: lucasmtercas
# In flickr, it is very tiring and boring to download the photos of an artist,
# the whole process taking around 5 or 6 clicks
# This scrit automates that, so all the photos are downloaded to the current
# directory

# TODO: Argument input of author
# TODO: Argument input of number of pages, or number of photos?
# TODO: Directly download the photos to a file? Or put the link in a text file?

require 'rubygems'
require 'nokogiri'
require 'net/http'

def get_photo(author, photo)
  uri = URI("https://www.flickr.com/photos/#{author}/#{photo}/sizes/k/")
  content = Net::HTTP.get(uri)
  page = Nokogiri::HTML(content)
  image_src = page.css("#allsizes-photo img").attr('src')
  puts "Image Source: #{image_src}"
end

def get_photos(author, page)
  uri = URI("https://www.flickr.com/photos/#{author}/page#{page}")
  content = Net::HTTP.get(uri)
  page = Nokogiri::HTML(content)
  page.css('.photo-list-photo-view').each do |photo_list_photo_view|
    style =  photo_list_photo_view.attr('style')
    background_img = style[/url\((.*)\)/,1]
    background_url = background_img[/\.com\/.*\/(.\d+)_/, 1]
    get_photo(author, background_url)
  end
end

print "Starting Downloader\n"
author = "megane_wakui"

for i in 0..5
  get_photos(author, i)
end
