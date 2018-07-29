class Ncourses < ActiveRecord::Migration[5.0]
    def change
      create_table :courses do |t|
        t.integer :student_record_id
        t.integer :concentration_id
        t.integer :professor_id
        t.string :title
        t.text :description
        t.string :day
        t.time :time
        t.string :semester
      end
    end
  end
