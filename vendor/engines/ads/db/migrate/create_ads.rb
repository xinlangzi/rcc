class CreateAds < ActiveRecord::Migration

  def self.up
    create_table :ads do |t|
      t.string :link
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index :ads, :id

    load(Rails.root.join('db', 'seeds', 'ads.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "ads"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/ads"})
    end

    drop_table :ads
  end

end
