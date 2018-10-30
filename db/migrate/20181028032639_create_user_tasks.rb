class CreateUserTasks < ActiveRecord::Migration[5.2]
  def up
    create_table :user_tasks do |t|
      t.references :user, foreign_key: true
      t.integer :sharer_id, index: true
      t.references :task, foreign_key: true
      t.boolean :share_type
      t.timestamps
    end
  end

  def down
    drop_table :user_tasks
  end
end
