require "nested_value"

class TestClass
  extend NestedValue
end

describe NestedValue do
  let(:nested_hash) { {:come_out => {:come_out => {:wherever => {:you_are => "Found ME!!!"}}}} }
  let(:mixed_hash) { {'come_out' => {:come_out => {'wherever' => {:you_are => "Found ME!!!"}}}} }
  let(:hash_with_array) { {:come_out => [{:wherever => {:you_are => "Found ME!!!"}}]} }

  it "gets a value that is nested in multiple hashes" do
    access_chain = [:come_out, :come_out, :wherever, :you_are]
    TestClass.nested_value(nested_hash, access_chain).should == "Found ME!!!"
  end

  it "doesn't have to traverse to a leaf node" do
    expected_value = {:wherever => {:you_are => "Found ME!!!"}}
    TestClass.nested_value(nested_hash, [:come_out, :come_out]).should == expected_value
  end

  it "returns nil if you go to far" do
    access_chain = [:come_out, :come_out, :wherever, :you_are, :already]
    TestClass.nested_value(nested_hash, access_chain).should == nil
  end

  it "returns nil if you attempt to access a key that doesn't exist somewhere down the chain" do
    TestClass.nested_value(nested_hash, [:come_out, :wherever, :you_are]).should == nil
  end

  it "returns nil if you attempt to access a top level key that doesn't exist" do
    TestClass.nested_value(nested_hash, [:not, :even, :close]).should == nil
  end

  it "doesn't care whether the key is a string" do
    TestClass.nested_value(nested_hash, ['come_out']).should == nested_hash[:come_out]
  end

  it "accesses the hash indifferently" do
    TestClass.nested_value(mixed_hash, ['come_out', 'come_out']).should == mixed_hash['come_out'][:come_out]
  end

  it "should take an array and return the value" do
    TestClass.nested_value(hash_with_array, [:come_out, 0, :wherever, :you_are]).should == "Found ME!!!"
  end

  it "returns nil if you pass an object in that isn't a Hash or Array" do
    TestClass.nested_value(0, ['some_key']).should == nil
  end

  it "doesn't mutate the value that gets passed in" do
    TestClass.nested_value(nested_hash, [:come_out, :come_out, :wherever, :you_are])
    nested_hash.should == {:come_out => {:come_out => {:wherever => {:you_are => "Found ME!!!"}}}}
  end

  it "works just fine with nested arrays" do
    TestClass.nested_value([[[],{:key => ["Found ME!!!", :a]}]], [0, 1, :key, 0]).should == "Found ME!!!"
  end
end
