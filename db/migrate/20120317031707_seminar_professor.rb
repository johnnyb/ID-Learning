class SeminarProfessor < ActiveRecord::Migration
  def up
    add_column :seminars, :professor_user_id, :integer
  end

  def down
    remove_column :seminars, :professor_user_id
  end
end
