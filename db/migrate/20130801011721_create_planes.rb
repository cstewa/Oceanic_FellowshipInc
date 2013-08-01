class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.float :number

      t.timestamps
    end
  end
end
