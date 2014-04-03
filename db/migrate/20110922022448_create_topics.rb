class CreateTopics < ActiveRecord::Migration

  def self.up
    create_table :topics do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

    add_index :topics, :id

    load(Rails.root.join('db', 'seeds', 'topics.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "topics"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/topics"})
    end

    drop_table :topics
  end

end
