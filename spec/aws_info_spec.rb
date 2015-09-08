require 'spec_helper'

describe AwsInfo do
  before do
    raw_response = "{\n  \"accountId\" : \"09090909090\",\n  \"instanceId\" : \"i-00009990\",\n  \"billingProducts\" : null,\n  \"instanceType\" : \"t2.micro\",\n  \"pendingTime\" : \"2015-09-04T19:03:47Z\",\n  \"imageId\" : \"ami-c8888888\",\n  \"kernelId\" : null,\n  \"ramdiskId\" : null,\n  \"architecture\" : \"x86_64\",\n  \"region\" : \"us-east-1\",\n  \"version\" : \"2015-10-31\",\n  \"privateIp\" : \"10.10.10.10\",\n  \"availabilityZone\" : \"us-east-1b\",\n  \"devpayProductCodes\" : null\n}"

    AwsInfo.stub(:query_instance_identity).and_return(raw_response)
  end

  it 'has a version number' do
    expect(AwsInfo::VERSION).not_to be nil
  end

  context '.info' do
    it 'returns a hash' do
      expect(AwsInfo.info.class).to eq(Hash)
    end

    it 'memoizes @@info' do
      AwsInfo.info # Set info if it hasn't been
      expect(AwsInfo).to receive(:load_info).exactly(0).times
      2.times { AwsInfo.info }
    end
  end

  context '.region' do
    it 'returns the region' do
      expect(AwsInfo.region).to eq('us-east-1')
    end
  end

  context '.ip' do
    it 'returns the ip' do
      expect(AwsInfo.ip).to eq('10.10.10.10')
    end
  end

  context '.availability_zone' do
    it 'returns the availability zone' do
      expect(AwsInfo.availability_zone).to eq('us-east-1b')
    end
  end

  context '.instance_id' do
    it 'returns the instance id' do
      expect(AwsInfo.instance_id).to eq('i-00009990')
    end
  end

  context '.instance_type' do
    it 'returns the instance type' do
      expect(AwsInfo.instance_type).to eq('t2.micro')
    end
  end

  context '.version' do
    it 'returns the version' do
      expect(AwsInfo.version).to eq('2015-10-31')
    end
  end

  context '.dev_pay_product_codes' do
    it 'returns the dev pay product codes' do
      expect(AwsInfo.dev_pay_product_codes).to eq(nil)
    end
  end

  context '.billing_products' do
    it 'returns the billing prooducts' do
      expect(AwsInfo.billing_products).to eq(nil)
    end
  end

  context '.account_id' do
    it 'returns the account id' do
      expect(AwsInfo.account_id).to eq('09090909090')
    end
  end

  context '.pending_time' do
    it 'returns the pending time' do
      expect(AwsInfo.pending_time).to eq('2015-09-04T19:03:47Z')
    end
  end

  context '.image_id' do
    it 'returns the image id' do
      expect(AwsInfo.image_id).to eq('ami-c8888888')
    end
  end

  context '.kernel_id' do
    it 'returns the kernel id' do
      expect(AwsInfo.kernel_id).to eq(nil)
    end
  end

  context '.ram_disk_id' do
    it 'returns the  ram disk id' do
      expect(AwsInfo.ram_disk_id).to eq(nil)
    end
  end

  context '.architecture' do
    it 'returns the architecture' do
      expect(AwsInfo.architecture).to eq('x86_64')
    end
  end

end
