class AddProfessorIdToStudentRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :student_records, :professor_id, :integer
  end
end
