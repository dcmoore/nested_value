require "nested_value"

class TestClass
  extend NestedValue
end

describe NestedValue do
  let(:nested_hash) { {:come_out => {:come_out => {:wherever => {:you_are => "Found ME!!!"}}}} }

  it "gets a value that is nested in multiple hashes" do
    TestClass.nested_value(nested_hash, [:come_out, :come_out, :wherever, :you_are]).should == "Found ME!!!"
  end

  it "doesn't have to traverse to a leaf node" do
    TestClass.nested_value(nested_hash, [:come_out, :come_out]).should == {:wherever => {:you_are => "Found ME!!!"}}
  end

  it "returns nil if you go to far" do
    TestClass.nested_value(nested_hash, [:come_out, :come_out, :wherever, :you_are, :already]).should == nil
  end

  it "returns nil if you attempt to access a key that doesn't exist somewhere down the chain" do
    TestClass.nested_value(nested_hash, [:come_out, :wherever, :you_are]).should == nil
  end

  it "returns nil if you attempt to access a top level key that doesn't exist" do
    TestClass.nested_value(nested_hash, [:not, :even, :close]).should == nil
  end
end
