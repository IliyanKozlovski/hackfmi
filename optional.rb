class Optional

 def initialize(val)
    @val = val
    return val
 end

 def method_missing(m, *args)
    @val = @val.public_send(m, *args)
    return self
 end
 
 def value
     return @val
 end
 
 def to_s
     @val = @val.to_s
     return self
 end
end

#puts Optional.new(nil).no_such_method.value #=> nil
puts a = Optional.new(1).succ.succ.to_s.value

#user = Optional.new(user)
#p balance = user.account.balance.value #=> nil if user.account is nil