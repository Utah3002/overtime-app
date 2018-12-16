class Post < ActiveRecord::Base
    enum status: { submitted: 0, approval: 1, rejected: 2 }
    belongs_to :user
    validates_presence_of :date, :rationale
end
