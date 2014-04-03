class AddForeignKey < ActiveRecord::Migration

  def self.up
    add_column :articles, :topic_id, :integer
    add_foreign_key :articles, :topics
  end

  def self.down
    remove_foreign_key :articles, :topics
    remove_column :articles, :topic_id
  end

end
