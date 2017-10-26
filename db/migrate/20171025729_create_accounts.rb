class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
			t.string :phone
			t.string :address
			t.string :website
			t.string :description
			t.string :website
			
      t.timestamps null: false
    end
  end
end
