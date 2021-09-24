# frozen_string_literal: true

require 'httparty'
# frozen_string_literal: true

# Scrapes the posts from the website
module Scrapers
  # Scrapes for the posts
  class Posts
    include HTTParty
    base_uri 'https://www.bigbinary.com'
    parser Scrapers::Utils::HtmlParser

    attr_accessor :category_url, :parse, :base_url

    def initialize(category_url)
      @category_url = category_url
      @parse = self.class.get(category_url)
      @base_url = self.class.default_options[:base_uri]
    end

    def list
      posts = parse.css('div.post')

      posts.map do |div|
        title = div.css('a>h2').text
        link = div.css('a').attribute('href').value
        description = div.css('div.text-base').text

        parse_post(title, "#{base_url}#{link}", description)
      end.flatten
    end

    private
    
    def parse_post(title, link, description)
      {
        title: title,
        link: link,
        description: description
      }
    end
  end
end
