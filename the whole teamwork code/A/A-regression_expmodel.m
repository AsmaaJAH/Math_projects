clc
clear

%% linear regression %%
n=input('please enter number of points ');
x=zeros(1,n);
y=zeros(1,n);
for i=1:n
    x(i)=input(sprintf("enter the value of x of point no%d: ",i));
    y(i)=input(sprintf("enter the value of y of point no%d: ",i));
    x ; y;
end
figure
plot(x,y)
sigmax=sum(x,'all');
sigmay=sum(y,'all');
squx=x.^2 ;  mulxy=x.*y ;
sigmaxy=sum(mulxy,'all');
sigmasqrx=sum(squx,'all');
syms a0 a1
eqn1=n*a0+sigmax*a1==sigmay ;
eqn2=sigmax*a0+sigmasqrx*a1==sigmaxy ;
sol=solve([eqn1,eqn2],[a0,a1]);
sol_a0=sol.a0;
a0=vpa(sol_a0,5)
sol_a1=sol.a1;
a1=vpa(sol_a1,5)
ssr=(y-(sol_a0)-(sol_a1.*x)).^2;
sr=sum(ssr,'all');
sst=(y-(sigmay/n)).^2;
st=sum(sst,'all');
rsqr=(st-sr)/st;
r_square=vpa(rsqr,5)
r=sqrt(rsqr);
r=vpa(r,5)
ynew=sol_a0+sol_a1.*x;
hold on
plot(x,ynew)
str={'red line : the solution of least square','blue line : line for data points'}
text(sigmax/n,sigmay/n,str)
%% exponential model %%
f=input(" do you want to use exponential model ? yes or no ...",'s')
      if f=="yes"
          c=input("do you want to use same data ? yes or no.. ",'s')
               if c=="yes"
                   syms a0_new a1_new
                   n2=n;
                   y2=y ;
                   x2=x;
                   Y1=log(y2);
                   X1=x2;
                   sigmaxx=sum(X1,'all');
                   sigmayy=sum(Y1,'all');
                   sqrxx=X1.^2;
                   sigmaxxsqr=sum(sqrxx,'all');
                   mulxy1=X1.*Y1;
                   sigmaxxy=sum(mulxy1,'all');
                   eqn111=n2*a0_new+sigmaxx*a1_new==sigmayy;
                   eqn222=sigmax*a0_new+sigmaxxsqr*a1_new==sigmaxxy;
                   sol1=solve([eqn111,eqn222],[a0_new,a1_new]);
                   sol1_a0=sol1.a0_new;
                   a0=vpa(sol1_a0,5)
                   sol1_a1=sol1.a1_new;
                   a1=vpa(sol1_a1,5)
                   a=exp(sol1_a0);
                   a=vpa(a,5)
                   b=sol1_a1;
                   b=vpa(b,5)
                   y2_new=a.*exp(b.*x2);
                   ssr=(Y1-(sol1_a0)-(sol1_a1.*X1)).^2;
                   sr=sum(ssr,'all');
                   sst=(Y1-(sigmayy/n2)).^2;
                   st=sum(sst,'all');
                   rsqr=(st-sr)/st;
                   r_square=vpa(rsqr,5)
                   r=sqrt(rsqr);
                   r=vpa(r,5)

                   figure
                   plot(x2,y2_new)
                   title("exponential model")
               else
                   n1=input("please enter the no. of new points : ")
                    for j=1:n1
             x1(j)=input(sprintf("enter the value of x of point no%d: ",j));
             y1(j)=input(sprintf("enter the value of y of point no%d: ",j));
            x1 ; y1;
                    end
                      syms a00 a11
                        Y=log(y1);
                        X=x1;
                       sigmax1=sum(X,'all');
                       sigmay1=sum(Y,'all');
                       sqrx=X.^2;
                       sigmaxsqr=sum(sqrx,'all');
                       mullxy=X.*Y;
                       sigmaxyc=sum(mullxy,'all');
                       eqn11=n1*a00+sigmax1*a11==sigmay1;
                       eqn22=sigmax1*a00+sigmaxsqr*a11==sigmaxyc;
                       sol2=solve([eqn11,eqn22],[a00,a11]);
                       sol2_a00=sol2.a00;
                       sol2_a11=sol2.a11;
                       a=exp(sol2_a00);
                       a=vpa(a,5)
                       b=sol2_a11;
                       b=vpa(b,5)
                       ynew1=a.*exp(b.*x1);
                       ssr=(Y-(sol2_a00)-(sol2_a11.*X)).^2;
                       sr=sum(ssr,'all');
                       sst=(Y-(sigmay1/n1)).^2;
                       st=sum(sst,'all');
                       rsqr=(st-sr)/st;
                       r_square=vpa(rsqr,5)
                       r=sqrt(rsqr);
                       r=vpa(r,5)
                       figure
                       plot(x1,ynew1)
                       title("exponential model")
               end; end;
     
        
        
            
            
