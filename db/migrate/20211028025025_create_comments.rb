class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
