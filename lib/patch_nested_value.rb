require "nested_value"

class Hash
  include NestedValue

  def nested_value_for(access_chain)
    nested_value(self, access_chain)
  end
end

class Array
  include NestedValue

  def nested_value_for(access_chain)
    nested_value(self, access_chain)
  end
end
