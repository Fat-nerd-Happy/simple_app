class ChangeAgeToMicroposts < ActiveRecord::Migration[5.1]
  def change
    change_column :microposts, :age, :string
  end
end
