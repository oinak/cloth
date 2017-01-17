class Garment
  include Mongoid::Document
  field :name, type: String
  field :sku, type: String
  field :color, type: String
  field :kind, type: String
  field :size, type: String
  field :price, type: Money
  field :brand, type: String
  validates :name, presence: true, length: { minimum: 3, allow_blank: false }
  validates :sku, presence: true, uniqueness: true
end
