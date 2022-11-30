class CreateBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.references :blog_category
      t.date :creation_date
      t.text :content
      t.integer :visibility_state
      t.timestamps
    end
  end
end
