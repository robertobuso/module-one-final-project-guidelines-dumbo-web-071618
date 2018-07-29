class AddGradesToStudentRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :student_records, :grade, :string
  end
end
