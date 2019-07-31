class MsTest

    def initialize(dwell, bloc)
        @dwell = dwell
        @bloc = bloc
    end

    def method_missing(name, *args)
        return @dwell if name.to_s =~ /dwell$/
        return @bloc if name.to_s =~ /bloc$/
    end
    
end

ms = MsTest.new(10,20)
puts ms.getdwell
puts ms.getbloc