class CreateTeachers < ActiveRecord::Migration
  def change
    drop_table :teachers
    create_table :teachers do |t|
      t.string :firstName
      t.string :name
      t.string :desk
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
