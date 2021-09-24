# frozen_string_literal: true

# Module for creating BigBinary
module BigBinary
  # Service creator for BigBinary
  class Creator
    attr_accessor :tags, :site

    def initialize
      @tags = ::Scrapers::Tags.new.list
      @site = ::Site.find_or_create_by(name: 'BigBinary', link: 'https://bigbinary.com')
    end

    def self.call
      new.perform
    end

    def perform
      return unless tags.present?

      find_or_create_tags!
      find_create_posts_by_tags!
    end

    private

    def find_or_create_tags!
      tags.each do |tag|
        ::Tag.find_or_create_by!(site_id: site.id, **tag)
      end
    end

    def find_create_posts_by_tags!
      tags.each do |tag|
        tag = ::Tag.find_by(tag)
        posts = ::Scrapers::Posts.new(tag[:link]).list

        find_or_create_posts!(tag, posts)
      end
    end

    def find_or_create_posts!(tag, posts)
      posts.each do |post|
        ::Post.find_or_create_by!(parse_post(tag, post))
      end
    end

    def parse_post(tag, post)
      post.merge(tag_id: tag.id)
    end
  end
end
