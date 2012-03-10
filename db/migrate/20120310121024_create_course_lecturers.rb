class CreateCourseLecturers < ActiveRecord::Migration
  def change
    create_table :course_lecturers do |t|
      t.integer :course_id
      t.integer :lecturer_user_id
      t.timestamps
    end
  end
end
