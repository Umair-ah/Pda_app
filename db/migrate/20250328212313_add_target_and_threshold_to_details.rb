class AddTargetAndThresholdToDetails < ActiveRecord::Migration[8.0]
  def change
    add_column :details, :target, :decimal
    add_column :details, :threshold, :decimal
  end
end
