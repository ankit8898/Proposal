class User < ActiveRecord::Base

validates_presence_of :name ,:company
has_many :proposals
belongs_to :country

belongs_to :company

def self.search(val)
where("name like ?", "%#{val}%")
end


end
