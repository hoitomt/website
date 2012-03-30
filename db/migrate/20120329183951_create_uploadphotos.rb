class CreateUploadphotos < ActiveRecord::Migration
  def self.up
    create_table :uploadphotos do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :uploadphotos
  end
end
