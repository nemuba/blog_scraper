# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :link, null: false
      t.references :site, foreign_key: true, null: false
      t.timestamps
    end
  end
end
