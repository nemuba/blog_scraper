# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :tag
  has_one :site, through: :tag

  validates :title, presence: true
  validates :link, presence: true
  validates :description, presence: true

  after_create_commit { broadcast_append_to site, target: 'post_list' }
  after_update_commit { broadcast_replace_to site }
  after_destroy_commit { broadcast_remove_to site }
end
