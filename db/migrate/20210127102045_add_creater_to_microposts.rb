class AddCreaterToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :creater, :string
  end
end
