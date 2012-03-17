class SeminarCourseAdditions < ActiveRecord::Migration
  def up
    add_column :seminars, :public, :boolean, :default => true
    add_column :courses, :public, :boolean, :default => true
    add_column :seminars, :enrollment_closed, :boolean, :default => false
    add_column :seminars, :completed, :boolean, :default => false
    add_column :users, :can_run_private_seminars, :boolean, :default => false
  end

  def down
    remove_column :seminars, :public
    remove_column :courses, :public
    remove_column :seminars, :enrollment_closed
    remove_column :seminars, :completed
    remove_column :users, :can_run_private_seminars
  end
end
