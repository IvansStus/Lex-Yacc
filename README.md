Ivan Stus
cssc1943, 821201908
CS530, Spring 2020
Assignment #3, Grammar Parser
README.md

File Manifest:
exp.l
exp.y
ex.txt
Makefile

Compile Instructions:
Compile by running Makefile on exp to create executable

Operating Instructions:
"make exp"
"exp"
**Make sure test file is under "ex.txt"**

Grammar:
<lines>      ::= <line> | <lines><line>
<line>       ::= <EOL> | <END> | <assign><EOL> | <exp><EOL>
<assign>     ::= <id><equals><exp><semi>
<exp>        ::= <id> | <id><op><exp> | <openParenthesis><id><op><id><closeParenthesis>
<op>         ::= +|-|*|/|%
<id>         ::= <char> | <id><char> | <id><digit>
<char>       ::= a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|
                 y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|
                 W|X|Y|Z
<digit>      ::= 0|1|2|3|4|5|6|7|8|9
<semi>       ::= ;
<equals>     ::= =
<openParen>  ::= (
<closeParen> ::= )
<EOL>        ::= '\n'
<END>        ::= <<EOF>>

Design:
Flex and Bison was used for this program as we just went over it in class and I wanted to get
familiarized with it. It was an easy tool to learn and use, that was able to optimize my code.

Extra Features:
A line counter was used to find the line of the error.

Lessons Learned:
I learned how to use Flex and Bison through working on this program and added another language
under my arsenal. I liked the practice this program provided with this new language and feel
comfortable using it again in the future.
