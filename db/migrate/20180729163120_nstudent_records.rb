class NstudentRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :student_records do |t|
      t.integer :student_id
    end
  end
end
