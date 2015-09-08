class DataHelper

  class << self

  def describe_tags
    '{
        "Tags": [
            {
                "ResourceType": "instance",
                "ResourceId": "i-0000000",
                "Value": "first",
                "Key": "firsttag"
            },
            {
                "ResourceType": "instance",
                "ResourceId": "i-0000000",
                "Value": "second",
                "Key": "tag2"
            }
        ]
    }'
  end

  def meta_data
    "{\n  \"accountId\" : \"09090909090\",\n  \"instanceId\" : \"i-00009990\",\n  \"billingProducts\" : null,\n  \"instanceType\" : \"t2.micro\",\n  \"pendingTime\" : \"2015-09-04T19:03:47Z\",\n  \"imageId\" : \"ami-c8888888\",\n  \"kernelId\" : null,\n  \"ramdiskId\" : null,\n  \"architecture\" : \"x86_64\",\n  \"region\" : \"us-east-1\",\n  \"version\" : \"2015-10-31\",\n  \"privateIp\" : \"10.10.10.10\",\n  \"availabilityZone\" : \"us-east-1b\",\n  \"devpayProductCodes\" : null\n}"
  end

  end # End class methods


end
