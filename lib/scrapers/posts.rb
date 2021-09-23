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

    def list(category_url)
      base_url = self.class.default_options[:base_uri]
      parse = self.class.get(category_url)

      posts = parse.css('div.post')

      posts.map do |div|
        title = div.css('a>h2').text
        link = div.css('a').attribute('href').value

        { title: title, link: "#{base_url}#{link}" }
      end.flatten
    end
  end
end
