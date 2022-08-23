class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.date :deadline
      t.text :notes
      t.string :url
      t.integer :status

      t.timestamps
    end
  end
end
