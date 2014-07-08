class Book < ActiveRecord::Migration
  def change
    add_column :books, :author, :string
    add_column :books, :town, :string
    add_column :books, :editor, :string
    add_column :books, :collection, :string
    add_column :books, :year, :integer
  end
end
