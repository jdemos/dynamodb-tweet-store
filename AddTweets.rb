require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'
require 'json'

# Create dynamodb client in us-west-2 region
dynamodb = Aws::DynamoDB::Client.new(region: 'us-west-2')

json_string = '{
  "created_at": "Wed Feb 07 23:02:39 +0000 2018",
  "id": 961374678718676992,
  "id_str": "961374678718676992",
  "text": "Your daily dose of 🏟️ \n\n#WatchStadium is streaming LIVE right here.👇\nhttps://t.co/ohHfk3ay70",
  "source": "Twitter Web Client",
  "truncated": false,
  "in_reply_to_status_id": null,
  "in_reply_to_status_id_str": null,
  "in_reply_to_user_id": null,
  "in_reply_to_user_id_str": null,
  "in_reply_to_screen_name": null,
  "user": {
    "id": 300392950,
    "id_str": "300392950",
    "name": "Twitter Sports",
    "screen_name": "TwitterSports",
    "location": null,
    "url": null,
    "description": "Cheering with Tweets",
    "translator_type": "none",
    "protected": false,
    "verified": true,
    "followers_count": 15568215,
    "friends_count": 997,
    "listed_count": 8610,
    "favourites_count": 4254,
    "statuses_count": 11625,
    "created_at": "Tue May 17 17:54:29 +0000 2011",
    "utc_offset": -28800,
    "time_zone": "Pacific Time (US & Canada)",
    "geo_enabled": true,
    "lang": "en",
    "contributors_enabled": false,
    "is_translator": false,
    "profile_background_color": "C0DEED",
    "profile_background_image_url": "http://pbs.twimg.com/profile_background_images/656936359/pjmryisi4g22te2awpxb.png",
    "profile_background_image_url_https": "https://pbs.twimg.com/profile_background_images/656936359/pjmryisi4g22te2awpxb.png",
    "profile_background_tile": true,
    "profile_link_color": "4A913C",
    "profile_sidebar_border_color": "C0DEED",
    "profile_sidebar_fill_color": "DDEEF6",
    "profile_text_color": "333333",
    "profile_use_background_image": true,
    "profile_image_url": "http://pbs.twimg.com/profile_images/875124274939387904/rv7oUjVJ_normal.jpg",
    "profile_image_url_https": "https://pbs.twimg.com/profile_images/875124274939387904/rv7oUjVJ_normal.jpg",
    "profile_banner_url": "https://pbs.twimg.com/profile_banners/300392950/1493928733",
    "default_profile": false,
    "default_profile_image": false,
    "following": null,
    "follow_request_sent": null,
    "notifications": null
  },
  "geo": null,
  "coordinates": null,
  "place": null,
  "contributors": null,
  "is_quote_status": false,
  "quote_count": 0,
  "reply_count": 2,
  "retweet_count": 6,
  "favorite_count": 31,
  "entities": {
    "hashtags": [
      {
        "text": "WatchStadium",
        "indices": [
          24,
          37
        ]
      }
    ],
    "urls": [
      {
        "url": "https://t.co/ohHfk3ay70",
        "expanded_url": "https://twitter.com/i/events/942819702044110848",
        "display_url": "twitter.com/i/events/94281…",
        "unwound": {
          "url": "https://twitter.com/i/events/942819702044110848",
          "status": 200,
          "title": "Stadium - Games, News & Highlights",
          "description": "Stadium"
        },
        "indices": [
          69,
          92
        ]
      }
    ],
    "user_mentions": [

    ],
    "symbols": [

    ]
  },
  "favorited": false,
  "retweeted": false,
  "possibly_sensitive": false,
  "filter_level": "low",
  "lang": "en",
  "matching_rules": [
    {
      "tag": null
    }
  ]
}'

item = JSON.parse(json_string)

params = {
    table_name: 'Tweets',
    item: item
}

begin
  result = dynamodb.put_item(params)
  puts 'Added Tweet: ' + item["id_str"].to_s + ' - ' + item["text"].to_s
rescue  Aws::DynamoDB::Errors::ServiceError => error
  puts 'Unable to add Tweets:'
  puts error.message
end