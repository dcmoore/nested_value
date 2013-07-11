Nested Value
============

Finally, a safe way to navigate the mean streets of nested data structures. Add it to your project as a gem dependency and use it like so:

```ruby
require "nested_value"

class MyClass
  include NestedValue

  def initialize
    @my_data = {:come_out => [{:come_out => {:wherever =>
      ["wrong turn", {:you_are => "Found ME!!!"}]}}, "some_value", 0]}
  end

  def correct
    nested_value(@my_data, :come_out, 0, :come_out, :wherever, 1, :you_are)
  end

  def incorrect
    nested_value(@my_data, :come_out, 0, :wherever, 0, :you_are)
  end

  def not_even_close
    nested_value(@my_data, :where, :are, :you, 99)
  end

  def going_halfway
    nested_value(@my_data, :come_out, 0, :come_out)
  end
end

MyClass.new.correct        #=> "Found Me!!!"
MyClass.new.incorrect      #=> nil
MyClass.new.not_even_close #=> nil
MyClass.new.going_halfway  #=> {:wherever=>["wrong turn", {:you_are=>"Found ME!!!"}]}
```

You could also extend the NestedValue module if you prefer.

In versions 0.0.2 and above, you can patch nested_value_for on Array and Hash with ease. All you have to do is require the patch_nested_value file.

```ruby
require "patch_nested_value"

my_array = [5,3,4,5,6,{some: "value"}]
my_array.nested_value_for(5, :some) #=> "value"

my_hash = {I: {can: {has: [:moneyz]}}}
my_hash.nested_value_for(:I, :can, :has, 0) #=> :moneyz
```

Enjoy!
