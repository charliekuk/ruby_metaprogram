# 关于类、对象和方法的认识

注意：*这里主要以ruby为主*

- 当你需要对一个对象做一个操作时，你可以为它单独设定一个类并写一个方法；此外，**你可以在这个对象的父类中直接定义新的方法，例如直接在String类中**。但需要注意的是，要警惕你的自定义方法与类中已有的方法冲突。所以尽量不要污染自带的类库。

- 当类中定义了方法之后，在该方法被对象调用前，对象内的实例变量是不存在的（除非初始化？）。只有在调用了该方法后，实例变量被赋值。
例如：

```ruby
class MyClass
  def my_method(text)
    @text = text
  end
end

obj = MyClass.new # 这一步obj里没有实例变量@text
obj.my_method('Hello')# 这一步才有@text = 'hello'

```

- 对象包括实例变量，而方法不在对象中。**方法只在类里**。此外，不能说~~这个类有一个方法~~，除非这是一个类方法，该类可以调用它。只能说**这个方法是该类的实例方法，只有定义一个类的实例才可以调用**。对象可以有一个方法，但这个方法并不在对象内部。

## Summary
So what is **object**? An object contains some instance viables and a reference to its class. 
Object don't contain methods, which are in the class.

What is **class**? class is also an object of Class with some instance viables and a reference to its superclass(module). A class is a module(with some differences).

module has some constants, and some methods. module provides the **namespace**, we can use :: to get the methods or constant.
