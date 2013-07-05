class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :body
      t.integer :question_id
      t.integer :user_id
    end
  end
end
