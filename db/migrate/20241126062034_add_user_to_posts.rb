class AddUserToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
