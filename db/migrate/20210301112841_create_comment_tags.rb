class CreateCommentTags < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_tags do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
