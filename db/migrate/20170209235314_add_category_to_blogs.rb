class AddCategoryToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :category, :string
  end
end
