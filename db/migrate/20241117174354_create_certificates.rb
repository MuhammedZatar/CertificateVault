class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :domain
      t.references :user, null: false, foreign_key: true
      t.string :file_path

      t.timestamps
    end
  end
end
