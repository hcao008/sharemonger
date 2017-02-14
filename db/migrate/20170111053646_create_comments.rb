class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :blog, foreign_key: true
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
