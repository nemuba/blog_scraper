# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, presence: true

  belongs_to :site
  has_many :posts, dependent: :destroy

  after_create_commit { broadcast_append_to site, target: 'tag_list' }
  after_update_commit { broadcast_replace_to site }
  after_destroy_commit { broadcast_remove_to site }
end
