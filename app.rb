require 'sinatra'
require 'json'
require_relative 'lib/fin_sentinel/nlp_fraud_detector'

set :port, 8080
set :server, 'puma'

before do
  content_type :json
end

post '/api/v1/transactions/analyze' do
  request.body.rewind
  payload = JSON.parse(request.body.read)
  
  # Evaluate transaction notes for localized digital fraud patterns
  detector = FinSentinel::NLPFraudDetector.new
  analysis = detector.analyze_transaction_notes(payload['description'])

  {
    transaction_id: payload['id'],
    fraud_risk_score: analysis[:score],
    flags: analysis[:flags],
    status: analysis[:score] > 0.7 ? 'flagged' : 'cleared'
  }.to_json
end

get '/health' do
  { status: 'operational' }.to_json
end
