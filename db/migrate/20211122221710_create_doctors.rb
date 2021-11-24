class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :fullname
      t.string :email
      t.string :CRM
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
