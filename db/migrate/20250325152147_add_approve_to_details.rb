class AddApproveToDetails < ActiveRecord::Migration[8.0]
  def change
    add_column :details, :approve, :boolean, default: false
  end
end
