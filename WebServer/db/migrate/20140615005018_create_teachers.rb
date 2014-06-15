class CreateTeachers < ActiveRecord::Migration
  def change
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
