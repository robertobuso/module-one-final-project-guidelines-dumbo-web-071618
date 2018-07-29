class Students < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :race
      t.datetime :start_date
      t.integer :student_record_id
      t.integer :admin_id
      t.string :status
    end
  end
end
