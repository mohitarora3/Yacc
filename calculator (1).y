%{
    #include<stdio.h>
    int flag=0;
%}
%token NUMBER 
%left '+' '-'      
%left '*' '/' '%'
%left '(' ')'
%right NEGATIVE
%%
value: E
       {
         printf("\nResult=%d\n",$$);
         return 0;
       }
      ;

E:
	  E'+'E   {$$=$1+$3;}          
	 |E'-'E   {$$=$1-$3;}
	 |E'*'E   {$$=$1*$3;}
	 |E'/'E   {$$=$1/$3;}
	 |E'%'E   {$$=$1%$3;}
	 |'('E')' {$$=$2;}
	 |NUMBER   {$$=$1;}
         ;
%%

void main()
{
   printf("\nEnter Expression you wish to compute:\n");
  flag=yyparse(); 
}
void yyerror()
{
   printf("\nInvalid Expression. Try Again.");
   flag=1;
}
