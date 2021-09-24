# frozen_string_literal: true

require 'httparty'
# frozen_string_literal: true

# Scrapes the categories from the website
module Scrapers
  # Scrapes for the tags
  class Tags
    include HTTParty
    base_uri 'https://www.bigbinary.com'
    parser Scrapers::Utils::HtmlParser

    attr_accessor :base_url, :parse, :categories

    def initialize
      @base_url = self.class.default_options[:base_uri]
      @parse = self.class.get('/blog/categories')
      @categories = parse.css('.page>ul>div')
    end

    def list
      categories.map do |div|
        category = div.css('a>div')

        category.map do |item|
          name = item.css('div:first').text
          link = div.css('a').attr('href').value

          { name: name, link: "#{base_url}#{link}" }
        end
      end.flatten
    end
  end
end
