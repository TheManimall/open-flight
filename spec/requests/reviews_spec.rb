require 'rails_helper'

describe 'Reviews API', type: :request do

  it 'create review' do
    airline = create(:random_airline)

    post '/api/v1/reviews', params: { 
      airline_id: Airline.last.id,
      description: 'Lorem ipsum',
      score: 3,
      title: 'Lorem ipsum'
    }, as: :json

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:ok)

    review_count = Review.count

    post '/api/v1/reviews', params: { 
      airline_id: Airline.last.id,
      description: 'Lorem ipsum',
      score: 3,
      title: nil
    }, as: :json

    expect(Review.count).to eq(review_count)
    expect(response).to have_http_status(422)
  end
end