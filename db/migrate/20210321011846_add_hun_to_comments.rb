class AddHunToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :hun, :integer
  end
end
