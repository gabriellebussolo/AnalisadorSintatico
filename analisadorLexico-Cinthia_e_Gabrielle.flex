/*
 * Nomes: Cinthia Becher e Gabrielle Bussolo
 */

/* Trab GA 2 */

import java_cup.runtime.*;

%%

%public
%unicode
%class foolLexer
%cup
%line
%column

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

// Palavras reservadas
classe = class 
constante = True|False
operadorLogico = not|and|or
condicional = if | else
retorno = return

boolType = bool
intType = int
voidType = void  

// Identificador e numero
identificador = [a-zA-Z_][a-zA-Z_0-9]*
numero = [0-9]+

// Operadores
operadorAritmetico = [\+\*]
operadorRelacional = (==|<|>)
igual = \=

// Pontuacao
pontoEVirgula = ;
virgula = ,
chaveEsq = \{
chaveDir = \}
parEsq = \(
parDir = \)

%%

// Palavras reservadas
{classe} { return symbol(sym.CLASSE); }

{boolType} { return symbol(sym.BOOL); }
{intType} { return symbol(sym.INT); }
{voidType} { return symbol(sym.VOID); }

{condicional} { return symbol(sym.CONDICIONAL); }

{constante} { return symbol(sym.CONSTANTE); }
{operadorLogico} { return symbol(sym.OPLOGICO); }

{retorno} { return symbol(sym.RETORNO); }

// Identificador e numeros
{identificador} { return symbol(sym.ID); }
{numero} { return symbol(sym.NUMERO); }

// Operadores
{operadorAritmetico} { return symbol(sym.OPARITIMETICO); }
{operadorRelacional} { return symbol(sym.OPRELACIONAL); }

{igual} { return symbol(sym.IGUAL); }

// Pontuacao
{parEsq} { return symbol(sym.PARESQ); }
{parDir} { return symbol(sym.PARDIR); }

{chaveEsq} { return symbol(sym.CHAVEESQ); }
{chaveDir} { return symbol(sym.CHAVEDIR); }

{pontoEVirgula} { return symbol(sym.PONTOEVIRGULA); }
{virgula} { return symbol(sym.VIRGULA); }

