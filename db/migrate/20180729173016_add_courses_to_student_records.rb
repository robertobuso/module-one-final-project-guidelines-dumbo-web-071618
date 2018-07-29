class AddCoursesToStudentRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :student_records, :course_id, :integer
  end
end
