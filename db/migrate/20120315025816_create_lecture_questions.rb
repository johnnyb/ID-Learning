class CreateLectureQuestions < ActiveRecord::Migration
  def change
    create_table :lecture_questions do |t|
      t.integer :lecture_id
      t.text :question_text
      t.integer :answer_number
      t.text :answer_text_1
      t.text :answer_text_2
      t.text :answer_text_3
      t.text :answer_text_4
      t.text :answer_text_5
      t.text :answer_text_6
      t.text :answer_text_7
      t.text :answer_text_8
      t.timestamps
    end
    add_column :lectures, :number_quiz_questions, :integer
    add_column :lectures, :number_correct_passing, :integer
  end
end
