class Optional

 def initialize(val)
    @val = val
    @methods = []
    @arguments = []
 end

 def method_missing(m, *args)
    @methods.push(m)
    @arguments.push(args)
    self
    
 end
 
 def value
    if @val.nil?
        return nil
    end

    for i in 0..@methods.size-1
        args = @arguments[i]
        method = @methods[i]
        puts method
        @val = @val.public_send(method, *args)
    end
    return @val
 end
 
 def to_s
     self.method_missing(:to_s)
 end
end


#puts Optional.new(nil).no_such_method.value #=> nil
#puts a = Optional.new(1).succ.succ.to_s.value

#user = Optional.new(user)
#p balance = user.account.balance.value #=> nil if user.account is nil
p Optional.new(42).succ.succ.succ.succ.succ.to_s.value #=> "47"
