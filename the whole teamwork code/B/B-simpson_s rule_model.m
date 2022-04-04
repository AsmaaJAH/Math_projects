clc
clear
disp("which method do you want to use?")
c=input("is it 1/3 simpson model? yes or no...",'s')
if c=="yes"
  Eq=input ('enter the equation ','s');
    F=inline(Eq,'x');
  a=input(" enter your start")
  b=input("enter your end")
m=input("do you want enter segment number",'s')
if m=="yes"
  n= input( "enter your segment number")
  h=(b-a)/n
else if m=="no" 
 h=input(" enter step size ")
 n=(b-a)/h
end;end
 
 x=a:h:b;
        sum=0;
        sum2=0
        for i=1:1:n+1
            g=F(x(i));
            y(i)=g; 
        end 
        for i=3:2:n-1
           
            sum= sum+y(i);
        end
        
          for i=2:2:n
            sum2= sum2+y(i);
          end 
        I=(y(1)+y(end)+2*sum +4*sum2)*h/3;
       
  
fprintf(' value is %f',I) 
 
end