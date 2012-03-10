class CreateLectureLinks < ActiveRecord::Migration
  def change
    create_table :lecture_links do |t|
      t.integer :lecture_id
      t.string :title
      t.text :description
      t.text :url
      t.boolean :required, :default => false
      t.integer :position
      t.timestamps
    end
  end
end
