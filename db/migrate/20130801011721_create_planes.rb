class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.integer :number

      t.timestamps
    end
  end
end
