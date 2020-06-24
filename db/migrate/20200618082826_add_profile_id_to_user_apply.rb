class AddProfileIdToUserApply < ActiveRecord::Migration[6.0]
  def change
    add_column :user_applies, :profile_id, :integer
  end
end
