# 代码块

## 复习

块，常用于迭代器，例如do each之类的方法。
块用大括号包围起来，一般用一行语句；
块的一个很重要的关键字是yield，它可以在一个方法中调用块，返回，并继续执行接下来的语句。
例如：

```ruby
def a_method(a,b)
a + yield(a,b)
end

a_method(1,2) {|x,y| (x+y)*3} => 10
```

- 使用block_given?方法判断当前方法是否包含块

## 作用域

当出现 class/module/def，则开始切换作用域

### 如何穿透作用域

Class.new => class name
Module.new => module name
define_method => def
*扁平化作用域*

## instance_eval

使用该方法可以触及类中的实例变量。例如

```ruby
class MyClass
    def initialize
        @v = 1
    end
end
obj = MyClass.new
obj.instance_eval do
    self
    @v
end
v = 2
obj.instance_eval {@v = v} #这里类中的实例变量v被赋予新的值2
```

## 延迟执行 proc lambda 方法

块并不是对象，如果想要把块当作对象来使用，则需要使用另一种方法。

1. Proc类
  例如：
  
  ```ruby
  inc = proc.new {|x| x - 1}
  inc.call(2)
  ```

2. 还有另外几种方法：lambda
  例如

  ```ruby
  dec = lambda {|x| x - 1}
  dec.call(2)
  ```

  与上面的方法效果一样。

了解**操作符&**
操作符&表示把这个变量转变为一个proc类型的量

### proc和lambda的区别

- **关于return** 在lambda中，它表示从lambda返回；在proc中，它表示从proc定义的作用域返回，超过这个作用域就无法触及到这个变量。

- lambda对参数的对应要求很严格，否则它会报错；而proc可以自己调整接受的参数个数，使其适应它被定义的输出。**为了防止歧义的产生，通常用lambda方法**

lambda方法的另一种写法是：

```ruby
bloc = -> (x) {x + 1}
```
