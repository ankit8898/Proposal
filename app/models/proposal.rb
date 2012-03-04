class Proposal < ActiveRecord::Base
has_draft
validates_presence_of :proposal_name, :description 
end
