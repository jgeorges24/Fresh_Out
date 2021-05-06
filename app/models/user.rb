class User < ApplicationRecord
 #making instance methods 
  has_secure_password

  #since tapes is being in use make sure to create brand new name for this has many below
  #has_many :tapes

  has_many :created_tapes, foreign_key: "user_id", class_name: "Tape"
  has_many :opinions
  has_many :tapes, through: :opinions

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  #validates other things too with user
end
