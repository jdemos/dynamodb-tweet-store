# dynamodb-tweet-store
Ruby code to create and manage a NoSQL database using the AWS DynamoDB service.

## Table of Contents
- [Getting Started](#getting-started)
  - [AWS Setup](#aws-setup)
  - [Using DynamoDB](#using-dynamodb) (create a table, insert data)
- [Reference links](#reference-links) (links to AWS docs and other helpful sites)
- [Notes](#notes)
- [To Do Items](#todo)

## Getting Started
There are two things you need to do to work with DynamoDB: 1) Set up the AWS side of things. 2) Learn how to use the DynamoDB service.

### AWS Setup
Before you use the AWS DynamoDB service, you first need to have an AWS account and your IAM (credential system) in place. Here's how to do that:
1. Get an AWS access key to use the AWS SDKs ([follow instructions here](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SettingUp.DynamoWebService.html#SettingUp.DynamoWebService.GetCredentials))
2. Install the AWS SDK for Ruby
```
gem install aws-sdk-dynamodb
```
NOTE: This repo uses [version 3](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/index.html), of the AWS Ruby SDK which is modularized so you only need to install the specific gem for the service you are using (e.g., dynamodb). Alternatively, you can run `gem install gem 'aws-sdk', '~> 3'` which installs every available AWS service gem. This will take significantly longer to install.

3. After the gem has successfully installed, I suggest running the `gem list` command to ensure you see the newly installed `aws-sdk-dynamodb` gem listed.
4. Setup your environnent variables by inserting the value (key, secret, region) and running each "export" command below.
    1. export AWS_ACCESS_KEY_ID='INSERT-YOUR-KEY-ID-HERE'
    2. export AWS_SECRET_ACCESS_KEY='INSERT-YOUR-SECRET-KEY-HERE'
    3. export AWS_REGION='YOUR-REGION-HERE' (e.g., us-west-2)
    
You can run the `printenv` command to see if the export commands above worked (look for each variable in the output).

### Using DynamoDB
1. Create a table
2. Add items to that table

## Reference links
The following list contains direct links to helpful AWS doc page and other sites that are a good point of reference for using Ruby to create and maintain a dynamoDB table:
- [Amazon DynamoDB Examples Using the AWS SDK for Ruby](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/dynamo-examples.html)
- [Setup config credentials](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html)
- [AWS official Ruby example scripts](https://github.com/awsdocs/aws-doc-sdk-examples/tree/master/ruby/example_code/dynamodb)
- [Example queries and other recipes](https://readysteadycode.com/howto-access-amazon-dynamodb-with-ruby)

## TODO
1. Add support for batch Tweet loader
2. Create class for easy plug-in to search-tweets-ruby client
