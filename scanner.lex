%{

/* Declarations section */
#include "tokens.hpp"
#include "output.hpp"

%}

%option yylineno
%option noyywrap

digit   		  ([0-9])
letter  		  ([a-zA-Z])
whitespace		([\r\t\n ])

%%

"void"                                      return VOID;
"int"                                       return INT;
"byte"                                      return BYTE;
"b"                                         return B;
"bool"                                      return BOOL;
"and"                                       return AND;
"or"                                        return OR;
"not"                                       return NOT;
"true"                                      return TRUE;
"false"                                     return FALSE;
"return"                                    return RETURN;
"if"                                        return IF;
"else"                                      return ELSE;
"while"                                     return WHILE;
"break"                                     return BREAK;
"continue"                                  return CONTINUE;
";"                                         return SC;
","                                         return COMMA;
"("                                         return LPAREN;
")"                                         return RPAREN;
"{"                                         return LBRACE;
"}"                                         return RBRACE;
"="                                         return ASSIGN;
"=="|"!="|"<"|">"|"<="|">="                 return RELOP;
"+"|"-"|"*"|"/"                             return BINOP;
\.\.                                        return DOTS;
{letter}({letter}|{digit})*                 return ID;
0|[1-9]{digit}*                             return NUM;
\"([^\n\r\"\\]|\\[rnt"\\])+\"               return STRING;
{whitespace}                                /* ignore */;
"//"[^\r\n]*[\r\n|\n|\r]?                  /* ignore */;


.                                           {
	                                            errorLex(yylineno);
											}

%%
