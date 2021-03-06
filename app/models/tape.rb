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
     #def self.search(query)

    #     self.where("title like ?", "%#{query}%")

    # end

    #scope method to chain the sql and ruby together easier to grab data
    scope :search, -> (query) {where("title LIKE ?", "%#{query}%") }


    #scope :most_recent, -> {order created_at: :desc}
    
      def self.recent_tape

          self.order(created_at: :desc)

      end

      #scope :uploaded_at, -> {created_at.to_date :desc}

    #date object for upload date 
    def uploaded_at
        self.created_at.to_date
    end
end