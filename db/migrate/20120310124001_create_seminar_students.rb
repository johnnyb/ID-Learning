class CreateSeminarStudents < ActiveRecord::Migration
  def change
    create_table :seminar_students do |t|
      t.integer :seminar_id
      t.integer :student_user_id
      t.boolean :student_confirmed, :default => false
      t.boolean :professor_confirmed, :default => false
      t.boolean :confirmed, :default => false
      t.boolean :rejected, :default => false
      t.timestamps
    end
  end
end
