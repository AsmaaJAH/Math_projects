clc
clear
arug=input("enter the name of the argument : ",'s');
fun=input(" please,enter your function in the form of f(x)=0: ",'s');
ans=input("will you use max error bound ....yes or no....",'s');
x0=input(sprintf("enter the intial of %s : ",arug));  
if(ans=="yes")
   e=input("enter the max error bound: ");
   eqn=str2sym(fun)
   diff_eqn=diff(eqn)
   xi=x0;xii=0;error=abs(xii-xi);
     while error>e 
       eqn1=subs(eqn,xi)
       diff_eqn1=subs(diff_eqn,xi)
       xii=xi-(eqn1/diff_eqn1);
       error=abs(xii-xi)
       xi=xii
       symn=sym(xii);
       solu=vpa(symn,7)
       erorr1=vpa(error,7)
     end
elseif(ans=="no")
    w=input("will you use no. of iterations...yes or no ....",'s');
    if(w=="yes")
      n=input("enter no. of iterations ");
      eqn=str2sym(fun)
      diff_eqn=diff(eqn)
      x1=x0;
        for i=1:1:n
           eqn1=subs(eqn,x1);
           diff_eqn1=subs(diff_eqn,x1)
           x(i)=x1-(eqn1/diff_eqn1);
           x1=x(i);
       
        end
        symn=sym(x1);
        soln=vpa(symn,7)
end;  end;

        
        
