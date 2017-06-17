class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :pack_type

      t.timestamps
    end
  end
end
