# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :tags
  has_many :posts, through: :tags

  after_create_commit { broadcast_append_to :sites }
  after_update_commit { broadcast_replace_to :sites }
  after_destroy_commit { broadcast_remove_to :sites }
end
