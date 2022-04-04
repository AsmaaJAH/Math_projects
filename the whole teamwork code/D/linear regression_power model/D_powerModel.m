
clear all
clc
%%%%%%%%%%%%% linear regression using power model%%%%%%%%%%%%%%%%%%%%%
%loading data from file
    x=xlsread('x.xlsx')
    y=xlsread('y.xlsx')
    figure
    scatter(x,y,'b')
    ylabel('y,Y')
    xlabel('x,X')
    hold on
   


%linear regrission using power model 
    %a b for power model
        X=log(x)
        Y=log(y)
        X_square= X.^2;
        XY= X.*Y;

        SumX=sum(X)
        SumY=sum(Y)
        SumX2=sum(X.^2)
        SumXY=sum(X.*Y)
        
   

    % a0 and a1 definition for linear regression analysis 
        n=length(X)
        a1=  ( n*SumXY - (SumX.*SumY) )   /   ( n*SumX2 - ((SumX) .^2) )
        a0= mean(Y)- a1*mean(X)
        
        
    %Correlation Coefficient   
        Sr=sum((Y-a0-a1.*X).^2)
        St=sum((y-mean(y)).^2);
        r=sqrt(abs(St-Sr)/St)
    
    %plotting_data
       b=a1
       a=exp(a0)
       Y_model=a.*(X.^b);
       plot(X,Y_model,'m')
       title ('The Power Model Is: y=a* x^b')
       fprintf('Our Power Model Is: y=%i * x^ %i',a,b)
       

