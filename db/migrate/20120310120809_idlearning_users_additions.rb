class IdlearningUsersAdditions < ActiveRecord::Migration
  def up
    add_column :users, :role_student, :boolean, :default => true
    add_column :users, :role_lecturer, :boolean, :default => false
    add_column :users, :role_professor, :boolean, :default => false
  end

  def down
    remove_columns :users, :role_student, :role_lecturer, :role_professor
  end
end
