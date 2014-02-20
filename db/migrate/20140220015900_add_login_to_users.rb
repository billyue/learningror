class AddLoginToUsers < ActiveRecord::Migration
  def change
    #add_column :users, :login, :String
    User.all.each do |u|
       u.update_attributes :login, u.last_name.downcase
    end    
  end
end
