# Factor Day 1 Exercises

Excerpts from: Bruce A. Tate, Fred Daoud, Ian Dees & Jack Moffitt's “Seven More Languages in Seven Weeks.” 

> Using only `*` and `+`, how would you calculate 3^2 + 4^2 with Factor?

```factor
3 3 * 4 4 * +
```

> Enter `USE: math.functions` in the Listener. Now, with `sq` and `sqrt`, calculate the square root of 3^2 + 4^2.

```factor
3 sq 4 sq + sqrt
```

> If you had the numbers 1 2 on the stack, what code could you use to end up with 1 1 2 on the stack?

```factor
1 2 over swap
```

> Enter `USE: ascii` in the Listener. Put your name on the stack, and write a line of code that puts `"Hello, "` in front of your name and converts the whole string to uppercase. Use the `append` word to concatenate two strings and `>upper` to convert to uppercase. Did you have to do any stack shuffling to get the desired result?

```factor
"mudge" "Hello, " swap append
```

> The `reduce` word takes a sequence, an initial value, and a quotation and returns the result of applying the quotation to the initial value and the first element of the sequence, then the result of applying the quotation to the result and the next element of the sequence, and so on. Using `reduce`, write a line of code that returns the sum of the numbers 1, 4, 17, 9, 11. Try it out on your own first, but if you are truly stuck, look back carefully over the pages you’ve just read. There is a hint hiding somewhere.

```factor
{ 1 4 17 9 11 } 0 [ + ] reduce
```

> Now calculate the sum of the numbers 1 to 100 in a similar fashion. Do not manually write the sequence of numbers. Instead, enter `USE: math.ranges` in the Listener, and use the `[1,b]` word to produce the sequence.

```factor
100 [1,b] 0 [ + ] reduce
```

> The `map` word takes a sequence and a quotation, and returns a sequence of results of applying the quotation to each value. Using map and the words that you have learned so far, write a line of code that returns the squares of the numbers 1 to 10.

```factor
10 [1,b] [ sq ] map
```

> Write a line of code that, given a number between 1 and 99, returns the two digits in the number. That is, given `42 <your code>`, you should get `4` and `2` on the stack. Use the words `/i`, `mod`, and `bi` to accomplish the task.

```factor
42 [ 10 /i ] [ 10 mod ] bi
```

> Repeat the previous exercise for any number of digits. Use a different strategy, though: first convert the number to a string, then iterate over each character, converting each character back to a string and then to a number. Enter `USE: math.parser` in the Listener and use `number>string`, `string>number`, `1string`, and `each`.

```factor
1234 number>string [ 1string string>number] each
```

