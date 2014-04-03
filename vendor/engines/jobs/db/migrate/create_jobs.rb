class CreateJobs < ActiveRecord::Migration

  def self.up
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :attachment_id
      t.integer :position

      t.timestamps
    end

    add_index :jobs, :id

    load(Rails.root.join('db', 'seeds', 'jobs.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "jobs"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/jobs"})
    end

    drop_table :jobs
  end

end
