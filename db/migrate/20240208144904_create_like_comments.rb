class CreateLikeComments < ActiveRecord::Migration[7.1]
  def change
    create_table :like_comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :comment, index: true
      t.timestamps
    end
  end
end
