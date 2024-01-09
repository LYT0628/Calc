%{
  int chars = 0;
  int words = 0;
  int lines = 0;
%}

%%

(([a-zA-Z]+)|(.[a-zA-Z]+)|(#[a-zA-Z]+)|([a-zA-Z]+:[a-zA-Z]+))((" "+[a-zA-Z]+)|(" "?.[a-zA-Z]+)|(" "?#[a-zA-Z]+)|([a-zA-Z]+:[a-zA-Z]+)|(" "*">"+" "*[a-zA-Z]+))* {
  printf("matched: %s",yytext);
}
.+ {printf("no match!! ");}
%%
int 
main(int argc, char** argv){
  yylex();

}

//  printf("%s",yytext);
// ([a-zA-Z]+) 元素选择器
// (.[a-zA-Z]+) 类选择器
// (#[a-zA-Z]+) ID 选择器
// ([a-zA-Z]+:[a-zA-Z]+) 伪类选择器
// (" "+[a-zA-Z]+) 后代选择器
// (" "*">"+" "*[a-zA-Z]+) 孩子选择器