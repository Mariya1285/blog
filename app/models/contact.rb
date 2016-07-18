class Contact < ActiveRecord::Base
	belongs_to :member
end


=begin %>

class CreateContacts < ActiveRecord::Migration
belongs_to :member
def up
create_table :contacts do |t|

t.string :mobile , :null => false, :default => “”
t.string :country , :null => false, :default => “”

end

end

def down
drop_table :contacts

end
end

<%
=end 
