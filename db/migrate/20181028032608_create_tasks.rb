class CreateTasks < ActiveRecord::Migration[5.2]
  def up
    create_table :tasks do |t|

      t.string :name
      t.text :description
      t.datetime :deadline
      t.references :user, foreign_key: true
      t.boolean :status
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
