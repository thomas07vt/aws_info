# AwsInfo

A gem to provide an easy way to load the AWS information from a given AWS instance. Automatically detect server IP, Region, Availability Zone, etc. as well as instance tags.

Under the hood this gem uses the aws meta data lookup url for instance information:
http://169.254.169.254/latest/dynamic/instance-identity/document

And it uses aws describe tags command on the aws server to get a list of tags: "aws ec2 describe-tags ..."


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aws_info'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_info

## Usage

```ruby
require 'aws_info'

AwsInfo.region
#=> "us-east-1"

AwsInfo.ip
#=> "10.10.10.10"

AwsInfo.availability_zone
#=> "us-east-1b"

AwsInfo.instance_id
#=> "i-00000000"

AwsInfo.instance_type
#=> "t2.micro"

AwsInfo.version
#=> "2015-1-21"

AwsInfo.dev_pay_product_codes
#=> nil

AwsInfo.billing_products
#=>  nil

AwsInfo.account_id
#=> "00000000000"

AwsInfo.pending_time
#=> "2015-09-04T19:03:47Z"

AwsInfo.image_id
#=> "ami-c8888888"

AwsInfo.kernel_id
#=> nil

AwsInfo.ram_disk_id
#=> nil

AwsInfo.architecture
#=> "x86_64"

AwsInfo.tags
#=> { 'my_tag' => 'my tag's value!'}

# Access a single tag
AwsInfo.tags['my_tag']
#=> "my tag's value!"

```



## Contributing

1. Fork it ( https://github.com/thomas07vt/aws_info/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
