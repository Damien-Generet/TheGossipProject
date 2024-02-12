class CreatePrivateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :recipient, index: true
      t.references :sender, index: true
      
      t.timestamps
    end
  end
end
