class AirlineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :slug, :avg_score, :popularity, :country, :user_id

  has_many :reviews
end
