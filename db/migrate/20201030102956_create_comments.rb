class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.references :blog_post
      t.timestamps
    end
  end
end
