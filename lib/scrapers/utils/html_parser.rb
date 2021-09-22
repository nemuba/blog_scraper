require 'httparty'
require 'nokogiri'
# frozen_string_literal: true

# Module for parsing HTML
module Scrapers
  module Utils
    # HTML Parser
    class HtmlParser < HTTParty::Parser
      def html
        Nokogiri::HTML(body)
      end
    end
  end
end
