class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.integer :student_record_id
      t.string :letter_grade
    end
  end
end
