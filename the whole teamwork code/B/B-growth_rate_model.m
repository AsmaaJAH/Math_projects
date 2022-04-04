clc
clear
disp("which method do you want to use?")
c=input("is it growth rate model? yes or no...",'s')
if c=="yes"
    d=input("how many points do you want to enter?")
    X=[]
    Y=[]
      
    for i=(1:d)
        x(i)=input("x=")
        y(i)=input("y=")
        X(i)=1./x(i)
        Y(i)=1./y(i)
    
    end
    smX = sum(X)
    smY = sum(Y)
    smX2 = sum(X.^2)
    smXY=sum(Y.*X)
  g=[d smX ;smX smX2];
  h=[smY smXY]
  a0a1=h/g
  a=1./a0a1(1,1)
  b=a.*a0a1(1,2)
f=(a.*x)./(b+x)
figure
   scatter(x,y)
   title('plot of the points')
   figure
   plot (x,f)
   title('using growth rate model')
  
   sr=sum((Y-a0a1(1,1)-a0a1(1,2).*X).^2)
   Yavg =(sum(Y))./d
   st=sum((Y-Yavg).^2)
 r2=(st-sr)./st
 r=(r2)^0.5
 disp(sprintf("Coefficient of Determination=%d",r2))
 
disp(sprintf("Correlation Coefficient=%d",r))
 
  end