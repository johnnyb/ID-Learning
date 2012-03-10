class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.integer :course_id
      t.string :name
      t.integer :position
      t.text :description
      t.text :lecture_notes
      t.timestamps
    end
  end
end
