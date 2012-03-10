class CreateSeminarProfessors < ActiveRecord::Migration
  def change
    create_table :seminar_professors do |t|
      t.integer :seminar_id
      t.integer :professor_user_id
      t.timestamps
    end
  end
end
