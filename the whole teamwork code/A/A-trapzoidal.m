clc
clear
arug=input(" enter its argument name   ",'s');
exp=input(" enter the experission of the function  ",'s');
fun=exp
fun=inline(exp,arug);
a=input(" enter the start of the interval ");
b=input("enter the end of interval ");
n=input("enter the number of segment ");
h=(b-a)/n;
fa=fun(a)
fb=fun(b)
y1=0;
for i=a+h:h:b-h
    y=fun(i)
    y1=y1+y
end
I=(h/2).*((2.*y1)+fa+fb)
func=@(arug) fun(arug) ;
exact_sol=integral(func,a,b)

