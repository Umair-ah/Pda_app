class AddSemToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :sem, :string
  end
end
