
:e
data type Either L R of
  Left L
  Right R
//│ ╔══[ERROR] identifier not found: L
//│ ║  l.3: 	data type Either L R of
//│ ╙──     	                 ^
//│ ╔══[ERROR] identifier not found: R
//│ ║  l.3: 	data type Either L R of
//│ ╙──     	                   ^
//│ ╔══[ERROR] identifier not found: L
//│ ║  l.4: 	  Left L
//│ ╙──     	       ^
//│ ╔══[ERROR] identifier not found: R
//│ ║  l.5: 	  Right R
//│ ╙──     	        ^
//│ Either: error -> error -> Left error | Right error
//│ Left: error -> {}
//│ Right: error -> {}

data type Either (L: _) (R: _) of
  Left L
  Right R
//│ Either: (L: 'a,) -> (R: 'b,) -> Left 'a | Right 'b
//│ Left: anything -> {}
//│ Right: anything -> {}

let l = Left 1
let r = Right "ok"
let e = if _ then l else r
//│ l: Left 1
//│ r: Right "ok"
//│ e: Left 1 | Right "ok"

:e // TODO
e as Either Int String
//│ ╔══[ERROR] Unsupported pattern shape:
//│ ║  l.37: 	e as Either Int String
//│ ╙──      	     ^^^^^^^^^^^^^^^^^
//│ res: error

// TODO
// e as (_: Either Int String)
// e as (_: Either (L: Int) (R: String))

:e // FIXME dedup errors
e as Either
//│ ╔══[ERROR] Type mismatch in 'as' binding:
//│ ║  l.48: 	e as Either
//│ ║        	^^^^^^^^^^^
//│ ╟── expression of type `?a -> error` does not match type `Left`
//│ ║  l.23: 	  Left L
//│ ║        	  ^^^^
//│ ╟── Note: constraint arises from data symbol:
//│ ║  l.23: 	  Left L
//│ ╙──      	  ^^^^
//│ ╔══[ERROR] Type mismatch in 'as' binding:
//│ ║  l.48: 	e as Either
//│ ║        	^^^^^^^^^^^
//│ ╟── expression of type `?a -> error` does not match type `Right`
//│ ║  l.24: 	  Right R
//│ ║        	  ^^^^^
//│ ╟── Note: constraint arises from data symbol:
//│ ║  l.24: 	  Right R
//│ ╙──      	  ^^^^^
//│ ╔══[ERROR] Type mismatch in 'as' binding:
//│ ║  l.48: 	e as Either
//│ ║        	^^^^^^^^^^^
//│ ╟── expression of type `{}` is not a function
//│ ║  l.23: 	  Left L
//│ ║        	  ^^^^^^
//│ ╟── Note: constraint arises from data type definition:
//│ ║  l.22: 	data type Either (L: _) (R: _) of
//│ ║        	          ^^^^^^^^^^^^^^^^^^^^^^^
//│ ║  l.23: 	  Left L
//│ ║        	^^^^^^^^
//│ ║  l.24: 	  Right R
//│ ║        	^^^^^^^^^
//│ ╟── from applied expression:
//│ ║  l.29: 	let l = Left 1
//│ ╙──      	        ^^^^
//│ res: Either


