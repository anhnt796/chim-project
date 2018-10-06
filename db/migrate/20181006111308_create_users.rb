class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_password
      t.string :user_mail
      t.string :user_role
      t.string :integer
      t.string :user_avatar

      t.timestamps null: false
    end
  end
end
