class CreateSeminarLectures < ActiveRecord::Migration
  def change
    create_table :seminar_lectures do |t|
      t.integer :lecture_id
      t.integer :position
      t.boolean :required, :default => true
      t.text :additional_notes
      t.timestamps
    end
  end
end
