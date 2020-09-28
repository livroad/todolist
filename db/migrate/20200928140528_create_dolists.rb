class CreateDolists < ActiveRecord::Migration[5.2]
  def change
    create_table :dolists do |t|
      t.string :content
      t.string :status

      t.timestamps
    end
  end
end
