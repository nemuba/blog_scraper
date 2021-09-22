class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :posts

  after_create_commit { broadcast_append_to :tags }
  after_update_commit { broadcast_replace_to :tags }
  after_destroy_commit { broadcast_remove_to :tags }
end
