Here is a more honest version of the last example. Ruby is a fairly pure object-oriented language, which borrows a good bit from Smalltalk. Pretty much everything is an object.
Ruby has a bit more complex syntax than Smalltalk, some of it designed to make much of Ruby look more conventional. But its invoking methods on objects just the same.

For instance, ordinary integers are objects of the class Fixnum. The numeric operations are methods. Ruby lets you write 3 * a, but what youre really doing is invoking the * method on the object 3, and you can write it that way 3.*(a).

The name Kernel refers to a built-in module. A module is similar to a static class in Java. The builtin-in functions print and printf are part of Kernel. As far as I can tell, the :: and . operators are equivalent.

Of course, string constants are objects of class String, and this is made explicit in the statement b = String.new(A String);. Notice that new is a method of class String, rather than being an operator as in Java and C++.

Well usually use the more conventional syntax, but the heavy use of objects provides gread flexibilty. Well flex later.

Also note that there is no sense of Javas wrapper classes, like Integer. When you write an integer constant, its an object of Rubys Integer class. There is no int.
