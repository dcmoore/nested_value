module NestedValue
  def nested_value(nested_data_structure, *ordered_list_of_keys)
    ordered_list_of_keys.inject(nested_data_structure) do |remaining_value, key|
      return unless can_be_read?(remaining_value)
      remaining_value = access_value(remaining_value, key)
    end
  end

  private

  def can_be_read?(remaining_value)
    remaining_value && (remaining_value.kind_of?(Hash) || remaining_value.kind_of?(Array))
  end

  def access_value(remaining_value, key)
    return if remaining_value.kind_of?(Array) && !key.kind_of?(Integer)
    remaining_value[key] ||
      if key.kind_of?(String)
        remaining_value[key.to_sym]
      else
        remaining_value[key.to_s]
      end
  end
end
