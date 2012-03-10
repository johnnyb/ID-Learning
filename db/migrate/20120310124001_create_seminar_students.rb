class CreateSeminarStudents < ActiveRecord::Migration
  def change
    create_table :seminar_students do |t|
      t.integer :seminar_id
      t.integer :student_user_id
      t.integer :student_confirmed, :boolean, :default => false
      t.integer :professor_confirmed, :boolean, :default => false
      t.integer :confirmed, :boolean, :default => false
      t.timestamps
    end
  end
end
