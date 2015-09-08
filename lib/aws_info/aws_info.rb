require 'net/http'
require 'json'

module AwsInfo

  class << self

    def info
      @@info ||= load_info
    end

    def region
      info["region"]
    end

    def ip
      info["privateIp"]
    end

    def availability_zone
      info["availabilityZone"]
    end

    def instance_id
      info["instanceId"]
    end

    def instance_type
      info["instanceType"]
    end

    def version
      info["version"]
    end

    def dev_pay_product_codes
      info["devpayProductCodes"]
    end

    def billing_products
      info["billingProducts"]
    end

    def account_id
      info["accountId"]
    end

    def pending_time
      info["pendingTime"]
    end

    def image_id
      info["imageId"]
    end

    def kernel_id
      info["kernelId"]
    end

    def ram_disk_id
      info["ramdiskId"]
    end

    def architecture
      info["architecture"]
    end



    private

    def load_info
      JSON.parse(query_instance_identity)
    end

    def query_instance_identity
      Net::HTTP.get(URI.parse('http://169.254.169.254/latest/dynamic/instance-identity/document'))
    end

  end # End class methods

end
