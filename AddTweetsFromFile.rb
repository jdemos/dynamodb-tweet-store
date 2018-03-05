require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'
require 'json'

# Create dynamodb client in us-west-2 region
dynamodb = Aws::DynamoDB::Client.new(region: 'us-west-2')

file = File.read('./tweets/papa-johns.json')
# JSON parse the results file returned from the Search API
search_results = JSON.parse(file)
# Create array of Tweets
tweets = search_results["results"]

tweets.each{ |tweet|
  # Delete key value pairs from 'user' obj if they contain empty strings
  tweet["user"].delete_if{ |k, v| v == "" }
  # Checks for empty strings - should only return 'false' if working correctly
  # puts tweet["user"].has_value?("")

  params = {
      table_name: 'Tweets',
      item: tweet
  }

  begin
    result = dynamodb.put_item(params)
    # Puts each Tweet added (id_str - text)
    puts 'Added Tweet: ' + tweet["id_str"].to_s # + ' - ' + tweet["text"].to_s

  rescue  Aws::DynamoDB::Errors::ServiceError => error
    puts 'Unable to add Tweet:' + tweet["id_str"].to_s
    puts error.message
  end
}