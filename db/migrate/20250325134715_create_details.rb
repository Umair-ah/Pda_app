class CreateDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :details do |t|
      t.string :faculty_name
      t.string :semester
      t.string :section
      t.string :academic_year
      t.string :subject_code

      t.decimal :co1
      t.decimal :co2
      t.decimal :co3
      t.decimal :co4
      t.decimal :co5

      t.decimal :see_co1_co5

      t.decimal :po1
      t.decimal :po2
      t.decimal :po3
      t.decimal :po4
      t.decimal :po5
      t.decimal :po6
      t.decimal :po7
      t.decimal :po8
      t.decimal :po9
      t.decimal :po10
      t.decimal :po11
      t.decimal :po12

      t.decimal :pso1
      t.decimal :pso2
      t.decimal :pso3

      t.timestamps
    end
  end
end
