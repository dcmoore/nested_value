module NestedValue
  def nested_value(some_nested_hash, ordered_list_of_keys)
    ordered_list_of_keys.inject(some_nested_hash.dup) do |acc, key|
      return unless acc && acc.class == Hash
      acc = acc[key]
    end
  end
end
