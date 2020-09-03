# copyright: 2018, Moises Tapia
content = inspec.profile.file("terraform.json")
params = JSON.parse(content)


title "Security Check"

#aws_vpc_id = attribute("aws_vpc_id", default: "", description: "Optional AWS VPC identifier.")

azone_var_db    = params['av_zone_db']['value']
azone_var_web   = params['av_zone_web']['value']
private_ip      = params['Private_ip']['value']
public_ip       = params['Public_ip']['value']
sg_ids          = params['security_group_id']['value']
# Locals

AMI_IMAGE = attribute('ami_id')

# Instances

control "EC2 instances" do
  impact 0.5
  title "Verify the instances ec2"
  desc ""
  
  describe aws_ec2_instances do
    its('instance_ids.count') { should cmp == 2 }
  end

  aws_ec2_instances.instance_ids.each do |instance_id|
    describe aws_ec2_instance(instance_id) do
      it              { should_not have_roles }
      its('image_id') { should eq AMI_IMAGE }
    end
  end

  aws_ec2_instances.where(name: "web").instance_ids.each do |id|
    describe aws_ec2_instance(id) do
      it                          { should_not have_roles }
      it                          { should be_running }
      its ('availability_zone')   { should eq azone_var_web }
      its ('public_ip_address')   { should eq public_ip }
      its ('security_group_ids')  { should include sg_ids }
    end
  end

  aws_ec2_instances.where(name: "db").instance_ids.each do |id|
    describe aws_ec2_instance(id) do
      it                          { should_not have_roles }
      it                          { should be_running }
      its ('availability_zone')   { should eq azone_var_db }
      its ('pribate_ip_address')   { should eq private_ip }
      its ('security_group_ids')  { should include sg_ids }
    end
  end
end

control "Security Group" do
  impact 1.0
  title "Verify the Security Group"
  desc ""
  describe aws_security_group(sg_ids) do
    it { should exist }
  end
  #describe aws_security_group(group_name: sg_ids) do
  #  its('outbound_rules.last') { should_not include(ip_ranges:['0.0.0.0/0']) }
  #end
  describe aws_security_group(group_name: sg_ids) do
    it { should allow_in(ipv4_range: ["0.0.0.0/0"], protocol: 'tcp') }
  end
  describe aws_security_group(group_name: sg_ids) do
    it { should allow_in(port: 22, ipv4_range: '0.0.0.0/0') }
    #it { should_not allow_in(port: 22, ipv4_range: '0.0.0.0/0') }
  end
  describe aws_security_group(group_name: 'Allow Web Traffic via HTTPS') do
    it { should allow_in_only(port: 443, security_group: sg_ids) }
  end
end


