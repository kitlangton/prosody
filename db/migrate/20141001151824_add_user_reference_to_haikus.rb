class AddUserReferenceToHaikus < ActiveRecord::Migration
  def change
    add_reference :haikus, :user, index: true
  end
end
