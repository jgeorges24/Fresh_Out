class User < ApplicationRecord
  has_secure_password
  #has_many :opinions
  #has_many :tapes, through: :opinions
  has_many :tapes

end
