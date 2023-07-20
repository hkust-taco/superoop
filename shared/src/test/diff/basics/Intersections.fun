
// Overloading is not yet really supported...
// the simplifier thinks it's an impossible type!
let foo = _ as (_: (Int => Int) & (Bool => Bool))
//│ foo: (_: nothing,)

:ns
let foo = _ as (_: (Int => Int) & (Bool => Bool))
let foo = (_ as (_: (Int => Int) & (Bool => Bool)))._1
//│ foo: forall 'a. (_: 'a,)
//│   where
//│     'a <: int -> int & bool -> bool
//│ where
//│   'a <: int -> int & bool -> bool
//│ foo: forall 'a. 'a

foo(1)
//│ res: nothing

:ns
foo(1)
//│ res: 'a

succ / foo(1)
//│ res: int

// Intersection-based overloading is not actually supported... a value of this type is impossible to provide:
let foo = (Int => Int) & (Bool => Bool)
//│ foo: int -> int & bool -> bool

:e
foo(1) // returns int & bool, equivalent to nothing
succ / foo(1)
foo(true)
not / foo(true)
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.32: 	foo(1) // returns int & bool, equivalent to nothing
//│ ║        	^^^^^^
//│ ╟── integer literal of type `1` is not an instance of type `bool`
//│ ║  l.32: 	foo(1) // returns int & bool, equivalent to nothing
//│ ║        	    ^
//│ ╟── but it flows into argument with expected type `bool`
//│ ║  l.32: 	foo(1) // returns int & bool, equivalent to nothing
//│ ║        	   ^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ╙──      	                          ^^^^
//│ res: bool | error | int
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.33: 	succ / foo(1)
//│ ║        	       ^^^^^^
//│ ╟── integer literal of type `1` is not an instance of type `bool`
//│ ║  l.33: 	succ / foo(1)
//│ ║        	           ^
//│ ╟── but it flows into argument with expected type `bool`
//│ ║  l.33: 	succ / foo(1)
//│ ║        	          ^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ╙──      	                          ^^^^
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.33: 	succ / foo(1)
//│ ║        	^^^^^^^^^^^^^
//│ ╟── reference of type `bool` is not an instance of type `int`
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ║        	                                  ^^^^
//│ ╟── but it flows into application with expected type `int`
//│ ║  l.33: 	succ / foo(1)
//│ ╙──      	       ^^^^^^
//│ res: error | int
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.34: 	foo(true)
//│ ║        	^^^^^^^^^
//│ ╟── reference of type `true` is not an instance of type `int`
//│ ║  l.34: 	foo(true)
//│ ║        	    ^^^^
//│ ╟── but it flows into argument with expected type `int`
//│ ║  l.34: 	foo(true)
//│ ║        	   ^^^^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ╙──      	           ^^^
//│ res: bool | error | int
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.35: 	not / foo(true)
//│ ║        	      ^^^^^^^^^
//│ ╟── reference of type `true` is not an instance of type `int`
//│ ║  l.35: 	not / foo(true)
//│ ║        	          ^^^^
//│ ╟── but it flows into argument with expected type `int`
//│ ║  l.35: 	not / foo(true)
//│ ║        	         ^^^^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ╙──      	           ^^^
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.35: 	not / foo(true)
//│ ║        	^^^^^^^^^^^^^^^
//│ ╟── reference of type `int` is not an instance of type `bool`
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ║        	                  ^^^
//│ ╟── but it flows into application with expected type `bool`
//│ ║  l.35: 	not / foo(true)
//│ ╙──      	      ^^^^^^^^^
//│ res: bool | error

:e
not / foo(1)
foo(1) as Nothing
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.108: 	not / foo(1)
//│ ║         	      ^^^^^^
//│ ╟── integer literal of type `1` is not an instance of type `bool`
//│ ║  l.108: 	not / foo(1)
//│ ║         	          ^
//│ ╟── but it flows into argument with expected type `bool`
//│ ║  l.108: 	not / foo(1)
//│ ║         	         ^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ╙──      	                          ^^^^
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.108: 	not / foo(1)
//│ ║         	^^^^^^^^^^^^
//│ ╟── reference of type `int` is not an instance of type `bool`
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ║        	                  ^^^
//│ ╟── but it flows into application with expected type `bool`
//│ ║  l.108: 	not / foo(1)
//│ ╙──       	      ^^^^^^
//│ res: bool | error
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.109: 	foo(1) as Nothing
//│ ║         	^^^^^^
//│ ╟── integer literal of type `1` is not an instance of type `bool`
//│ ║  l.109: 	foo(1) as Nothing
//│ ║         	    ^
//│ ╟── but it flows into argument with expected type `bool`
//│ ║  l.109: 	foo(1) as Nothing
//│ ║         	   ^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ╙──      	                          ^^^^
//│ ╔══[ERROR] Type mismatch in 'as' binding:
//│ ║  l.109: 	foo(1) as Nothing
//│ ║         	^^^^^^^^^^^^^^^^^
//│ ╟── reference of type `int` does not match type `nothing`
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ║        	                  ^^^
//│ ╟── but it flows into application with expected type `nothing`
//│ ║  l.109: 	foo(1) as Nothing
//│ ║         	^^^^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.109: 	foo(1) as Nothing
//│ ╙──       	          ^^^^^^^
//│ res: nothing

:e
foo as Nothing
//│ ╔══[ERROR] Type mismatch in 'as' binding:
//│ ║  l.159: 	foo as Nothing
//│ ║         	^^^^^^^^^^^^^^
//│ ╟── type intersection of type `int -> int & bool -> bool` does not match type `nothing`
//│ ║  l.28: 	let foo = (Int => Int) & (Bool => Bool)
//│ ║        	          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//│ ╟── but it flows into reference with expected type `nothing`
//│ ║  l.159: 	foo as Nothing
//│ ║         	^^^
//│ ╟── Note: constraint arises from reference:
//│ ║  l.159: 	foo as Nothing
//│ ╙──       	       ^^^^^^^
//│ res: nothing

:e
let oops = (&)
//│ ╔══[ERROR] Illegal use of reserved operator: &
//│ ║  l.175: 	let oops = (&)
//│ ╙──       	           ^^^
//│ ╔══[ERROR] identifier not found: &
//│ ║  l.175: 	let oops = (&)
//│ ╙──       	           ^^^
//│ oops: error

