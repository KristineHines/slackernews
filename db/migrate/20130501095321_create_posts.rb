class CreatePosts < ActiveRecord::Migration
  def change
    create_table  :posts do |t|
      t.string    :title
      t.text      :post_body
      t.references :user
      t.text :url
      t.timestamps
    end
  end
end
