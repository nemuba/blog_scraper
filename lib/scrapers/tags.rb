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

    def list
      base_url = self.class.default_options[:base_uri]
      parse = self.class.get('/blog/categories')

      categories = parse.css('.page>ul>div')

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
