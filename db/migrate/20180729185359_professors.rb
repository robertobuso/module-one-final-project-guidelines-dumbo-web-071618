class Professors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :admin_id
      t.string :semester_available
    end
  end
end
