class Proposal < ActiveRecord::Base
validates_presence_of :proposal_name, :description
belongs_to :user
end
