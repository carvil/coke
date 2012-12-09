class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id, type: Integer
  field :sentiment, type: BigDecimal
  field :user_handle, type: String
  field :followers, type: Integer
  field :message, type: String

  field :_id, type: Integer, default: -> { id }

  attr_accessible :id, :sentiment, :user_handle, :followers, :message

  validates_presence_of :id
end
