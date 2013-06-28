Nested Value
============

Finally, a safe way to navigate the mean streets of nested data structures. Add it to your project as a gem dependency and use it like so:

```ruby
require "nested_value"

class MyClass
  include NestedValue

  def initialize
    @my_hash = {:come_out => {:come_out => {:wherever => {:you_are => "Found ME!!!"}}}}
  end

  def correct
    nested_value(@my_hash, [:come_out, :come_out, :wherever, :you_are])
  end

  def incorrect
    nested_value(@my_hash, [:come_out, :wherever, :you_are])
  end

  def not_even_close
    nested_value(@my_hash, [:where, :are, :you])
  end

  def going_halfway
    nested_value(@my_hash, [:come_out, :come_out])
  end
end

MyClass.new.correct        #=> "Found Me!!!"
MyClass.new.incorrect      #=> nil
MyClass.new.not_even_close #=> nil
MyClass.new.going_halfway  #=> {:wherever => {:you_are => "Found ME!!!"}}
```

You could also extend the NestedValue module if you prefer.

Enjoy!
