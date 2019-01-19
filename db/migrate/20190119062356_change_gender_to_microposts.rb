class ChangeGenderToMicroposts < ActiveRecord::Migration[5.1]
  def change
    change_column :microposts, :gender, :string
  end
end
