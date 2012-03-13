class LectureVideo < ActiveRecord::Migration
  def up
    add_column :lectures, :video_url, :text
  end

  def down
    remove_column :lectures, :video_url
  end
end
