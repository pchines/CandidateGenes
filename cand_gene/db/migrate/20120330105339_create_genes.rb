class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :symbol
      t.string :long_name
      t.text :summary

      t.timestamps
    end
  end
end
