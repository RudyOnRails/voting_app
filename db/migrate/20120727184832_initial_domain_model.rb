class InitialDomainModel < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.references :parent, :user
      t.string :title
      t.timestamps
    end
    create_table :users do |t|
      t.string :username
      t.timestamps
    end
    create_table :votes do |t|
      t.references :question, :user
      t.timestamps
    end
  end

end
