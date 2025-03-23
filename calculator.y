%{
    #include<stdio.h>
    int flag=0;
    void yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{
         printf("\nResult=%d\n",$$);
         return 0;
        };
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {
         if($3 == 0) {
             printf("\nHata: Sifira bolme hatasi!\n");
             flag=1;
             return 1;
         }
         $$=$1/$3;
       }
 |E'%'E {
         if($3 == 0) {
             printf("\nHata: Sifira bolme hatasi (mod islemi)!\n");
             flag=1;
             return 1;
         }
         $$=$1%$3;
       }
 |'('E')' {$$=$2;}
 | NUMBER {$$=$1;}
;
%%

void main()
{
   printf("\nHesaplamak istediğiniz aritmetik operasyonu giriniz:\n");
   printf("Desteklenen operatörler: +, -, *, /, %%\n");
   printf("Örnek: 5 + 3 * 2\n");
   yyparse();
   if(flag==0)
   printf("\nAritmetik söz dizimi uygun\n\n");
}

void yyerror(const char *s)
{
   printf("\nHata: %s\n", s);
   printf("Lütfen geçerli bir aritmetik ifade giriniz.\n");
   printf("Örnek: 5 + 3 * 2\n\n");
   flag=1;
}