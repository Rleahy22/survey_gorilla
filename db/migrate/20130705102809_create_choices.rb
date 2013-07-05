class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :body
      t.integer :question_id
      t.integer :count
    end
  end
end
