
clc
clear
o=input("is the method you want to use bisection method? yes or no...",'s')
if o=="yes"
      fun=input ('enter the equation of x ','s');
      f=inline(fun,'x');
        h=input(" enter your beginning point")
        w=input("enter your ending point")
  while f(h)* f(w)>= 0
disp("The interval should contain root, enter a correct interval") 

    h=input("Enter the beginning point again:"); 
    w=input("Enter the ending point again:");
  end
  
  k=input("do you want enter segment number ? ",'s');
if k=="yes"
  n= input("how many iteration do you want to enter?")
  e=((w-h)./2^n) ;
else 
    e =input ("enter the maximum error ");
    uu=log2((w-h)./e) ;
    n= ceil(uu);
end; end ;
   
   for j=(1:n-1)
      x(j)=(h+w)/2 ;
       f(x(j)); f(h) ;  f(w);
   if f(x(j))*f(h) <0
      w=x(j) 
   else f(w)*f(x(j)) <0 
         h=x(j)        
   end
   x(j+1)=(h+w)/2 ;
   end
   ERR =(x(j)-x(j+1));
   if abs(ERR) <=e
       fprintf('the root is %g\n',x(j+1))
   end
    
     
 
      
