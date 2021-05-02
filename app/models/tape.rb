class Tape < ApplicationRecord
    belongs_to :user
    has_many :opinions
    has_many :users, through: :opinions


    validates :title, :artist, presence: true

    # Must add validations for creating the mixtape secure those attributes
    #has_one :user

    #create a date object method for mixtapes uplaoded at?

    #Create a search class method for this Tape object so we can query with active record when finding these different mixtapes

    #FIX THIS SEARCH METHOD
    def self.search(query)

        self.where("title like %?%")

    end
end