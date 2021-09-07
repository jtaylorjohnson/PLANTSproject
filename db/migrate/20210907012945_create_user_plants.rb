class CreateUserPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :user_plants do |t|
      t.resources :user
      t.resources :plant

      t.timestamps
    end
  end
end
