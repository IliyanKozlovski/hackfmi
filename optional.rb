class Optional

$arr = []
 def initialize(val)
    @val = val
    return val
 end

 def method_missing(m, *args)
 	$arr << m
	self
 end
 
 def value
 	if @val == nil
 		puts "nil"
 		puts "Missing methods"
 		print $arr
 	end
 	
     return @val
 end
 
 def to_s
     @val = @val.to_s
     return self
 end
end

#puts Optional.new(nil).no_such_method.fe.value #=> nil
#p a = Optional.new(14).succ.succ.to_s.value #=> 14

#user = Optional.new(user)
#p balance = user.account.balance.value #=> nil if user.account is nil