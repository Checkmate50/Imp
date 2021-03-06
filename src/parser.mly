
%{
open ImpAST
open Str

exception ParseException of string
%}

(* Tokens *)

%token EOF
%token <int> NUM
%token <string> ID
%token SKIP
%token TRUE
%token FALSE
%token PRINT

(* Precedences *)



(* After declaring associativity and precedence, we need to declare what
   the starting point is for parsing the language.  The following
   declaration says to start with a rule (defined below) named [prog].
   The declaration also says that parsing a [prog] will return an OCaml
   value of type [ImpAST.prog]. *)

%start main
%type <ImpAST.prog> main

(* The following %% ends the declarations section of the grammar definition. *)

%%

main:
  | c = com; EOF;
    { c }

com:
  | SKIP;
    { Skip }
  | PRINT; a = aexp;
    { Print(a) }

bexp:
  | TRUE;
    { True }
  | FALSE;
    { False }

aexp:
  | n = NUM;
    { Num(n) }

%%