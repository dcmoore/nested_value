require "patch_nested_value"

describe "patching nested value" do
  let(:test_hash) { {:some => {:series => {:of => {:keys => "Value"}}}} }
  let(:access_chain) { [:some, :series, :of, :keys] }

  describe Hash do
    it { should be_kind_of(NestedValue) }

    describe "#nested_value_for" do
      it "calls nested value" do
        test_hash.should_receive(:nested_value).with(test_hash, *access_chain)
        test_hash.nested_value_for(*access_chain)
      end
    end
  end

  describe Array do
    it { should be_kind_of(NestedValue) }

    describe "#nested_value_for" do
      it "calls nested value" do
        test_hash.should_receive(:nested_value).with(test_hash, *access_chain)
        test_hash.nested_value_for(*access_chain)
      end
    end
  end
end
