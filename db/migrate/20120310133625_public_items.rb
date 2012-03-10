class PublicItems < ActiveRecord::Migration
  def up
    add_column :courses, :published, :boolean, :default => false
    add_column :courses, :active, :boolean, :default => true
    add_column :seminars, :active, :boolean, :default => true
    add_column :seminars, :published, :boolean, :default => false
  end

  def down
    remove_columns :courses, :published, :active
  end
end
