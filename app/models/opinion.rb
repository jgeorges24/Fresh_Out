class Opinion < ApplicationRecord

    belongs_to :user
    belongs_to :tape

    #add some validations for the opinions
    validates :context, presence: true
end
