class CreateTestTakers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_takers do |t|
      t.string :login, null:false, index: { unique: true }
      t.string :password, null: false
      t.string :title, null:false
      t.string :lastname
      t.string :firstname, null: false
      t.string :gender, null: false
      t.string :email
      t.string :picture
      t.text :address

      t.timestamps
    end
  end
end