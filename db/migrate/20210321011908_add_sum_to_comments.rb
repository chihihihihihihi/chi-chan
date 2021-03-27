class AddSumToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :sum, :integer
  end
end
