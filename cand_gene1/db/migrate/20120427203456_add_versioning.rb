class AddVersioning < ActiveRecord::Migration
  def up
    Gene.create_versioned_table
    Topic.create_versioned_table
    Feature.create_versioned_table
  end

  def down
    Gene.drop_versioned_table
    Topic.drop_versioned_table
    Feature.drop_versioned_table
  end
end
