class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
			t.string :title
			t.string :email
			t.string :phone
			t.string :description
			
      t.timestamps null: false
    end
  end
end
