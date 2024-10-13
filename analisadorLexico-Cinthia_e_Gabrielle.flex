/*
 * Nomes: Cinthia Becher e Gabrielle Bussolo
 */

/* Trab GA 2 */

import java_cup.runtime.Symbol;

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
not = not
and = and
or = or
if = if
else = else
retorno = return

boolType = bool
intType = int
voidType = void  

// Identificador e numero
identificador = [a-zA-Z_][a-zA-Z_0-9]*
numero = [0-9]+

// Operadores
soma = \+
multiplicacao = \*
opIgual = \=\=
opMenor = <
opMaior = >
igual = \=

// Pontuacao
pontoEVirgula = ;
virgula = ,
chaveEsq = \{
chaveDir = \}
parEsq = \(
parDir = \)

ignorar = [\n|\s|\t\r]

%%

// Palavras reservadas
{classe} { return symbol(sym.CLASSE); }

{boolType} { return symbol(sym.BOOL); }
{intType} { return symbol(sym.INT); }
{voidType} { return symbol(sym.VOID); }

{if} { return symbol(sym.IF); }
{else} { return symbol(sym.ELSE); }

{constante} { return symbol(sym.CONSTANTE); }
{not} { return symbol(sym.NOT); }
{and} { return symbol(sym.AND); }
{or} { return symbol(sym.OR); }

{retorno} { return symbol(sym.RETORNO); }

// Identificador e numeros
{identificador} { return symbol(sym.ID); }
{numero} { return symbol(sym.NUMERO); }

// Operadores
{soma} { return symbol(sym.SOMA); }
{multiplicacao} { return symbol(sym.MULTIPLICACAO); }
{opIgual} { return symbol(sym.OPIGUAL); }
{opMaior} { return symbol(sym.OPMAIOR); }
{opMenor} { return symbol(sym.OPMENOR); }

{igual} { return symbol(sym.IGUAL); }

// Pontuacao
{parEsq} { return symbol(sym.PARESQ); }
{parDir} { return symbol(sym.PARDIR); }

{chaveEsq} { return symbol(sym.CHAVEESQ); }
{chaveDir} { return symbol(sym.CHAVEDIR); }

{pontoEVirgula} { return symbol(sym.PONTOEVIRGULA); }
{virgula} { return symbol(sym.VIRGULA); }

{ignorar} {}
