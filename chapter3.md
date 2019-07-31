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
