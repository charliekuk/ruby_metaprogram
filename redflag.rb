# def event(name)
#   puts "ALERT: #{name}" if yield
# end

# Dir.glob('*event.rb').each {|file| load file}
#初始化proc方法
lambda {
  setups = [] #定义setup数组
  events = {} #定义events哈希

  Kernel.send :define_method, :event do |name, &block| #在内核模块中定义event方法->将名称与布尔返回值对应
    events[name] = block
  end

  Kernel.send :define_method, :setup do |&block| #在内核模块中定义setup方法->将块赋与数组
    setups << block
  end

  Kernel.send :define_method, :each_setup do |&block| #在内核模块中定义each_setup方法->setups中每一项取得setup这个值
    setups.each do |setup|
      block.call setup
    end
  end

  Kernel.send :define_method, :each_event do |&block| #在内核模块中定义each_event方法->events中每一项取得name 和 event变量
    events.each_pair do |name, event|
      block.call name, event
    end
  end

  
}.call #立刻调用

Dir.glob('*event.rb').each do |file| #找到目录下每一个以event.rb结尾的文件
  load file #加载文件
  each_event do |name, event| #调用each_event方法，其输入就是一个块
    env = Object.new #新建对象
    each_setup do |setup| #调用each_setup方法，其输入就是一个块
      env.instance_eval &setup # 用instance_eval方法调用setup方法作为一个块
    end
    puts "ALERT: #{name}" if env.instance_eval &event #用instance_eval方法调用event作为一个块，以块中的布尔值作为返回值
  end
end

#########
#这个程序的完全运行过程为：
#lambda块定义方法并调用（使其生效）
#主程序：
#找到所需要的测试文件
#加载文件
#在加载的文件中运行event方法（运行2次）
#调用event_each方法，并运行方法内部的语句 （a）
#构造env对象
#调用each_setup并运行方法内部代码
#对第一个event判断并决定是否输出（b）
#对第二个event重复(a)-(b)
################