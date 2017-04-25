require 'net/http'
require 'json'
require 'timeout'

module AwsInfo
  DEFAULT_REGION = 'us-east-1'

  class << self

    def tags
      @tags ||= load_tag_data
    end

    def info
      if @info.nil? || @info == {}
        @info = load_meta_data
      else
        @info
      end
    end

    def region
      info["region"] || DEFAULT_REGION
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

    def load_tag_data
      tag_array = JSON.parse(query_tag_data)["Tags"] rescue []
      tag_array.inject({}) { |tags, e| tags[e["Key"]] = e["Value"]; tags }
    end

    def query_tag_data
      # You must have permissions to run aws ec2 describe-tags
      # Is there a better way to get this without relying on sysyem calls?
      # Aws sdk provides this, but do I want to rely on the aws-adk?
      `aws ec2 describe-tags --region #{region} --filter "Name=resource-id,Values=#{instance_id}"`
    end

    def load_meta_data
      JSON.parse(query_instance_identity)
    rescue => e
      puts 'Could not load AwsInfo. Is 169.254.169.254 reachable?'
      {}
    end

    def query_instance_identity
      Timeout::timeout(1) {
        url = 'http://169.254.169.254/latest/dynamic/instance-identity/document'
        Net::HTTP.get(URI.parse(url))
      }
    end
  end # End class methods
end
