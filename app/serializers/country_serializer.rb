class CountrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :country

  has_many :reviews
end