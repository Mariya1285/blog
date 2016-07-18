class AddMobileColumnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :mobile, :string
  end
end
