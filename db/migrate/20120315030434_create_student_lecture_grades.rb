class CreateStudentLectureGrades < ActiveRecord::Migration
  def change
    create_table :student_lecture_grades do |t|
      t.integer :student_user_id
      t.integer :lecture_id
      t.integer :number_questions
      t.integer :number_answers_correct
      t.boolean :passed, :default => false
      t.timestamps
    end
  end
end
