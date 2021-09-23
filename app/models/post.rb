# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :tag

  after_create_commit { broadcast_append_to :posts }
  after_update_commit { broadcast_replace_to :posts }
  after_destroy_commit { broadcast_remove_to :posts }
end
