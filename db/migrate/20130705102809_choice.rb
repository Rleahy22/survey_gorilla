class Choice < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :body
      t.integer :question_id
    end
  end
end
