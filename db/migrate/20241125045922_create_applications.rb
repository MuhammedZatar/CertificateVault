class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.text :description
      t.string :access_token, null: false, unique: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
