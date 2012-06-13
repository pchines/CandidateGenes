class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :disease,        :null => false
      t.text   :description
      t.float  :prevalence
      t.float  :prevalence_finn

      t.timestamps
    end
    Gene.select('disease').uniq.each do |g|
      Disease.create({:disease => g.disease})
    end
  end
end
