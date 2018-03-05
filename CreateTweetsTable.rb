require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'

# Create dynamodb client in us-west-2 region
dynamodb = Aws::DynamoDB::Client.new(region: 'us-west-2')

# Create table Tweets with id_str (string) as partition/primary key
params = {
    table_name: 'Tweets',
    key_schema: [
        {
            attribute_name: 'id_str',
            key_type: 'HASH'  #Partition key
        },
        {
            attribute_name: 'text',
            key_type: 'RANGE' #Sort key
        }
    ],
    attribute_definitions: [
        {
            attribute_name: 'id_str',
            attribute_type: 'S'
        },
        {
            attribute_name: 'text',
            attribute_type: 'S'
        }

    ],
    provisioned_throughput: {
        read_capacity_units: 10,
        write_capacity_units: 10
  }
}

begin
    result = dynamodb.create_table(params)

    puts 'Created table. Status: ' +
        result.table_description.table_status;
rescue  Aws::DynamoDB::Errors::ServiceError => error
    puts 'Unable to create table:'
    puts error.message
end