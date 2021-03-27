class AddByoToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :byo, :integer
  end
end
