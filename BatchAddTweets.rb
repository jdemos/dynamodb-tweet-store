require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'
require 'json'

# adding multiple items to a batch
batch = AWS::DynamoDB::BatchWrite.new

file = File.read('black-panther.json')
# JSON parse the results file returned from the Search API
search_results = JSON.parse(file)
# Create array of Tweets
tweets = search_results["results"]

puts tweets.class

# batch.put('Tweets', [
#   { :id => 'id1', :color => 'red' },
#   { :id => 'id2', :color => 'blue' },
#   { :id => 'id3', :color => 'green' },
# ])
# batch.process!