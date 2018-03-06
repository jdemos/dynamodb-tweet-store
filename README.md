# dynamodb-tweet-store
Ruby code to create and manage a NoSQL database using the AWS DynamoDB service.

## Table of Contents
- [Getting Started](#getting-started)
  - AWS Setup
  - Using DynamoDB (create a table, insert data)
- Reference links (links to AWS docs and other helpful sites)
- Notes
- To Do Items

## Getting Started
There are two things you need to do to work with DynamoDB: 1) Set up the AWS side of things. 2) Learn how to use the DynamoDB service.

### AWS Setup
Before you use the AWS DynamoDB service, you first need to have an AWS account and your IAM (credential system) in place. Here's how to do that:
1. Get an AWS access key to use the AWS SDKs
2. Install the AWS SDK for Ruby
```
gem install aws-sdk-dynamodb
```
3. Test

### Using DynamoDB
1. This
2. That
3. This

## Reference links
The following list contains direct links to helpful AWS doc page and other sites that are a good point of reference for using Ruby to create and maintain a dynamoDB table:
- [Amazon DynamoDB Examples Using the AWS SDK for Ruby](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/dynamo-examples.html)
- [Setup config credentials](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html)
- [AWS official Ruby example scripts](https://github.com/awsdocs/aws-doc-sdk-examples/tree/master/ruby/example_code/dynamodb)
- [Example queries and other recipes](https://readysteadycode.com/howto-access-amazon-dynamodb-with-ruby)

## TODO
1. Add support for batch Tweet loader
2. Create class for easy plug-in to search-tweets-ruby client
