
loop='yes';
while(loop=='yes')
type=input("enter the wanted solution method: \n 1 for power model \n 2 for the trapezoidal method \n 3 for Euler's method ");
switch (type)  
    case 1 %%power model
        clear all
        n=input('enter number of x values ');
        for i= 1:n 
          x(i)=input(sprintf('enter the %d x value',i));
          y(i)=input(sprintf('enter the %d y value',i));
        end
        Y=log(y);
        X=log(x);
        sig_X=sum(X);
        sig_Y=sum(Y);
        sig_X2=sum(X.^2);
        sig_XY=sum(X.*Y);
        
        % n*a0 + sig_X*a1 == sig_Y; % sig_X*a0 + sig_X2*a1 == sig_XY;
        A=[n sig_X ;sig_X sig_X2];
        B=[sig_Y sig_XY];
        a0a1=B/A
        a0=a0a1(1,1);
        a1=a0a1(1,2);
        a=exp(a0);
        b=a1;
        y_new=a.*(x.^b);
        
        %% correlation coef
        ssr=(Y-(a0)-(a1.*X)).^2;
        sr=sum(ssr,'all');
        sst=(Y-(sig_Y/n)).^2;
        st=sum(sst,'all');
        r2=(st-sr)/st;
        r=sqrt(r2);
        
        %% plotting
        figure
        subplot(3,1,1); scatter(x,y);xlabel('x');ylabel('y');title('the given points');
        subplot(3,1,2); plot(x,y);xlabel('x');ylabel('y');title('the given points as contineos');
        subplot(3,1,3);plot(x,y_new);xlabel('x');ylabel('y');title('the least square plot');
        
        %% output 
        window=msgbox({sprintf("a0 = %f , a1 = %f",a0,a1);sprintf("Y = %f + (%f) X ",a0,a1);sprintf("a = %f , b = %f ",a,b);sprintf("y = %f *(x^ %f) ",a,b);sprintf("r^2 = %f, r = %f",r2,r)})
        set(window, 'position', [100 300 220 130]);
        ah = get( window, 'CurrentAxes' );
        ch = get( ah, 'Children' );
        set( ch, 'FontSize', 14 )
   
    case 2   %% trapezoidal
        clear all
        eq = input('enter the equation: ','s');
        f=inline(eq,'x');
        a=input('enter start of interval ');
        b=input('enter end of interval ');
        choose=input('choose :\n 1 for using step size \n 2 for using segments number ');
        switch (choose)
            case 1
                h = input('enter step size ');
                n=(b-a)/h;
            case 2
                n = input('enter segments number ');
                h=(b-a)/n;
        end
        x=a:h:b;
        sum=0;
        for i=1:1:n+1
            g=f(x(i));
            y(i)=g; 
        end 
        for i=2:1:n
            sum= sum+y(i);
        end
        I=(y(1)+y(n+1)+2*sum)*h/2;
        plot(x,y);xlabel('x');ylabel('y');title(eq);
        %% output
        window=msgbox(sprintf("I = %f ",I));
        set(window, 'position', [100 100 100 50]);
        ah = get( window, 'CurrentAxes' );
        ch = get( ah, 'Children' );
        set( ch, 'FontSize', 14 )
  
    case 3  %% Euler's mrthod
        clear all
        eq = input('enter the equation: ','s');
        h=input('enter step size ');
        a=input('inter initial value of x ');
        b=input('inter last value of x ');
        n=(b-a)/h;
        x=a:h:b;
        f=inline(eq,'x','y');
        y=zeros(size(x));
        y(1)=input('enter the initial value of y ');
        for (i=1:1:n)
            y(i+1)=y(i)+h.*f(x(i),y(i));
        end
        figure
        plot(x,y);xlabel('x');ylabel('y');title(eq); 
end
loop=input('do you want to do another process:  yes or no ','s');
end  