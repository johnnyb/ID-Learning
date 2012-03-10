class CreateSeminars < ActiveRecord::Migration
  def change
    create_table :seminars do |t|
      t.string :name
      t.text :description
      t.string :code
      t.string :registration_code
      t.timestamps
    end
  end
end
