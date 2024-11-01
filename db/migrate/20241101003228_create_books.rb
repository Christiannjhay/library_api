class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.date :published_date
      t.integer :available_copies

      t.timestamps
    end
  end
end
