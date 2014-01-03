# 2 "lexer.mll"
         
        open Parser        (* The type token is defined in parser.mli *)
        exception Eof
        
# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\236\255\237\255\238\255\239\255\240\255\241\255\242\255\
    \243\255\244\255\245\255\000\000\000\000\000\000\000\000\252\255\
    \078\000\254\255\255\255\000\000\001\000\251\255\000\000\002\000\
    \012\000\000\000\001\000\250\255\000\000\002\000\016\000\002\000\
    \012\000\000\000\000\000\000\000\006\000\248\255\001\000\000\000\
    \001\000\005\000\006\000\011\000\019\000\246\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\010\000\010\000\010\000\010\000\255\255\
    \002\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \006\000\255\255\255\255\255\255\255\255\255\255\008\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_default = 
   "\255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\000\000\
    \255\255\000\000\000\000\255\255\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\018\000\017\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \018\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \005\000\004\000\000\000\000\000\003\000\000\000\000\000\000\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\000\000\002\000\000\000\000\000\000\000\000\000\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\014\000\012\000\010\000\010\000\
    \010\000\010\000\011\000\015\000\013\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\007\000\025\000\006\000\031\000\033\000\
    \000\000\035\000\041\000\034\000\039\000\038\000\021\000\030\000\
    \026\000\019\000\027\000\037\000\036\000\043\000\020\000\028\000\
    \024\000\032\000\023\000\042\000\040\000\022\000\029\000\044\000\
    \045\000\000\000\000\000\009\000\000\000\008\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\255\255\255\255\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\000\000\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\024\000\000\000\030\000\032\000\
    \255\255\034\000\040\000\033\000\038\000\011\000\020\000\029\000\
    \025\000\014\000\026\000\036\000\035\000\042\000\019\000\012\000\
    \023\000\031\000\022\000\041\000\039\000\013\000\028\000\043\000\
    \044\000\255\255\255\255\000\000\255\255\000\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec token lexbuf =
    __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 7 "lexer.mll"
                           ( token lexbuf )
# 137 "lexer.ml"

  | 1 ->
# 8 "lexer.mll"
                           ( EOL )
# 142 "lexer.ml"

  | 2 ->
let
# 9 "lexer.mll"
                          lxm
# 148 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 9 "lexer.mll"
                              ( INT(int_of_string lxm) )
# 152 "lexer.ml"

  | 3 ->
# 10 "lexer.mll"
                       ( SS )
# 157 "lexer.ml"

  | 4 ->
# 11 "lexer.mll"
                              ( LINE )
# 162 "lexer.ml"

  | 5 ->
# 12 "lexer.mll"
                              ( TURNPHI )
# 167 "lexer.ml"

  | 6 ->
# 13 "lexer.mll"
                              ( TURN )
# 172 "lexer.ml"

  | 7 ->
# 14 "lexer.mll"
                              ( MOVENOSCALE )
# 177 "lexer.ml"

  | 8 ->
# 15 "lexer.mll"
                       ( MOVE )
# 182 "lexer.ml"

  | 9 ->
# 16 "lexer.mll"
                              ( RECTANGLE )
# 187 "lexer.ml"

  | 10 ->
let
# 17 "lexer.mll"
                                lxm
# 193 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 17 "lexer.mll"
                                     ( SYMBOL(lxm))
# 197 "lexer.ml"

  | 11 ->
# 18 "lexer.mll"
                    ( LBRACE )
# 202 "lexer.ml"

  | 12 ->
# 19 "lexer.mll"
                    ( RBRACE )
# 207 "lexer.ml"

  | 13 ->
# 20 "lexer.mll"
                           ( LSQBRACKET )
# 212 "lexer.ml"

  | 14 ->
# 21 "lexer.mll"
                    ( RSQBRACKET )
# 217 "lexer.ml"

  | 15 ->
# 22 "lexer.mll"
                           ( LPAREN )
# 222 "lexer.ml"

  | 16 ->
# 23 "lexer.mll"
                           ( RPAREN )
# 227 "lexer.ml"

  | 17 ->
# 24 "lexer.mll"
                           ( COMMA )
# 232 "lexer.ml"

  | 18 ->
# 25 "lexer.mll"
                    ( SEMICOLON )
# 237 "lexer.ml"

  | 19 ->
# 26 "lexer.mll"
                           ( EOF )
# 242 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

