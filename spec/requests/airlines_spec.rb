require 'rails_helper'

describe 'Airline API', type: :request do
  let(:rand_airline) { create(:random_airline, name: "United America") }
  let(:user) { create(:user) }

  it 'return all airlines' do
    airline = create(:airline)
    get '/api/v1/airlines'

    response_body = JSON.parse(response.body)
    expected_attributes = {
      "avg_score" => 0,
      "name" => "United Airlines",
      "slug" => "united-airlines",
      "popularity" => 8,
      "image_url" => "https://open-flights.s3.amazonaws.com/United-Airlines.png",
      "country" => "USA"
    }

    expect(response).to have_http_status(:success)
    expect(response_body.size).to eq(2)
    expect(response_body["data"].size).to eq(1)
    expect(response_body["data"][0]["attributes"]).to include(expected_attributes)
  end

  it 'return airline' do
    get '/api/v1/airlines/flyfree'

    expect(response).to have_http_status(:success)
  end

  it 'delete airline' do
    delete "/api/v1/airlines/#{rand_airline.slug}"

    expect(Airline.find_by(slug: rand_airline.slug)).to be_nil
  end

  it 'check update airline' do
    put "/api/v1/airlines/#{rand_airline.slug}", 
      params: { 
        airline: { name: "brand-new-campain" }
      } 

    expect(Airline.find_by(name: "brand-new-campain")).to be_present
  end

  it 'check search airline by name' do
    create(:airline)
    get "/api/v1/airlines/search/U"

    response_body = JSON.parse(response.body)
    
    expect(response).to have_http_status(:success)
    expect(response_body.size).to eq(2)
    expect(response_body["data"].size).to eq(1)
  end

  it 'check create airline' do
    post '/api/v1/airlines', params: {
      airline: {
        user_id: user.id,
        name: '123',
        image_url: 'image.url',
        popularity: 4,
        country: 'Ukraine',
      } 
  
    }, as: :json

    # binding.pry

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:ok)
    expect(Airline.find_by(name: "123")).to be_present
  end

  it 'check statistics page' do
    airline = create(:random_airline)
    expect_hash = { airline.country => 1 }
    
    get '/api/v1/airlines/by_country'

    expect(JSON.parse(response.body)).to include(expect_hash)
  end
end