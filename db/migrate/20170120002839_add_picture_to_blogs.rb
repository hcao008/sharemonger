class AddPictureToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :picture, :string
  end
end
