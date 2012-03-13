class LecturesActive < ActiveRecord::Migration
  def up
    add_column :lectures, :active, :boolean, :default => true
    execute("UPDATE lectures SET active = true")
  end

  def down
    remove_column :lectures, :active
  end
end
