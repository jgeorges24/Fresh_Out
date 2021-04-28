class Tape < ApplicationRecord
belongs_to :user
has_many :opinion
#has_one :user

    #create a date object method for mixtapes uplaoded at?

    #Create a search class method for this Tape object so we can query with active record when finding these different mixtapes

end
