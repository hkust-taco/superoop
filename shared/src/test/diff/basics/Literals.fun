
1
//│ res: 1

"hello"
//│ res: "hello"

// TODO literal booleans
true
//│ res: bool


let f = b => if b then 0 else 1
//│ f: bool -> 0 | 1

let pred = n => 0 < n
//│ pred: int -> bool

let g = x => if pred x then x else f false
//│ g: 'a & int -> 'a | 1 | 0

g 3
//│ res: 1 | 0 | 3

g / succ 3
//│ res: int

x => if x then x else f false
//│ res: 'a & bool -> 'a | 1 | 0

res false
//│ res: 1 | 0 | bool

let rec f = n =>
  if pred n then n else f (n + 1)
//│ f: int -> int

let g = n =>
  if pred n then 0 else if not (pred n) then 1 else f n
//│ g: int -> int

x => if pred x then x else f x
//│ res: int -> int

:e
f false
//│ ╔══[ERROR] Type mismatch in application:
//│ ║  l.46: 	f false
//│ ║        	^^^^^^^
//│ ╟── expression of type `bool` does not match type `int`
//│ ║  l.46: 	f false
//│ ║        	  ^^^^^
//│ ╟── Note: constraint arises from argument:
//│ ║  l.35: 	  if pred n then n else f (n + 1)
//│ ╙──      	                           ^
//│ res: bool | int | error