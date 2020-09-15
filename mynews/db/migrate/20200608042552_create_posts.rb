class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.text :category # 1:스포츠 2:연애 3:일상 4:기타 
      t.belongs_to :user
      t.timestamps
    end
  end
end
