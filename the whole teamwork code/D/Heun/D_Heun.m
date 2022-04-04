                                     %%%%%%%  Heun's method %%%%%%%
%%%%%%the below ideas are inspired by: (question 4 and 3 in sheet 3) ,in addition to:(ex3 in lec  11 dr sara) but my code can run any binomial eq in a similar form to them%%%%%%%%
format short
clear all 
clc

%initialization and definitions:
    %our users are asked to Enter their data
        h=input('please enter step size, for ex: 0.25 \n');
        t0=input('please enter ur initialization of t ,for ex: 0 \n');
        y0=input('please enter ur initialization of y ,for ex: 1 \n');
        t_end =input('please enter the end of your t interval ,for ex: 1 \n');
        t_start=t0;
        
        itr = abs( t_end - t_start)/ h;         %num of itrations
        
         y=0;                                   
         t=0;                                   
         y=[y0 y];                              %concatination
         t=[t0 t];                              %concatination
         
% choosing from the GUI menu that will appear to the user by clicking the buttoms
%%%%%%the below ideas are inspired by: (question 4 & 3 in sheet 3) ,in addition to:(ex3 in lec  11 dr sara) but my code can run any binomial eq in a similar form to them%%%%%%%%
          fprintf('choose from the GUI menu that will appear to you by clicking the buttoms.\n')
          choose = menu("please choose the desired form of your binomial eq:","y'=(y*(t^a))+b*y","y'=(y^a)+b",... 
              "y'=a*t+b*y");
          a=input('please enter "a" value for the eq that u choosed \n');
          b=input('please enter "b" value for the eq that u choosed \n');
  
          
for  i=1:itr
  switch choose
      case 1                          % Example 3 in lec  11 dr sara  _ Heun's method 
          
        y_diff=y0*(t0^a)+b*y0;        %eq
        y1=y0+(h*y_diff);             %Predictor
       
        t1=t0+h;                      %updating t 
        y1=(y1*t1^a)+b*y1;            %updating y1
       
        y1=y0+((h/2)*(y_diff + y1));  %corrector 
        
        y(i+1)=y1;                       %saving output
        t(i+1)=t1;                       %saving output
        
        y0=y1;                         %preparing for the next itration
        t0=t1;                         %preparing for the next itration
        itr=itr-1 ;                    %preparing for the next itration
        
     case 2                             % Question 4 in sheet3  dr sara  _ Heun's method 
        y_diff=(y0^a)+b;                 %eq
        y1=y0+(h*y_diff);                %Predictor
       
        y1=(y1^a)+b;                       %updating y1
        t1=t0+h;                         %updating t
       
        y1=y0+((h/2)*(y_diff + y1));     %corrector 
        
        y(i+1)=y1;                       %saving output
        t(i+1)=t1;                       %saving output
        
        y0=y1;                         %preparing for the next itration
        t0=t1;                         %preparing for the next itration
        itr=itr-1 ;                    %preparing for the next itration 
        
    case 3                              % Question 3 in sheet3  dr sara  _ Heun's method 
        y_diff=(a*t0)+(b*y0);     %eq
        y1=y0+(h*y_diff);         %Predictor
       
        t1=t0+h;                  %updating t
        y1=a*t1+b*y1;            %updating y1
       
        y1=y0+( (h/2)*(y_diff + y1)); %corrector 
        
        y(i+1)=y1;                       %saving output
        t(i+1)=t1;                       %saving output
        
        y0=y1;                         %preparing for the next itration
        t0=t1;                         %preparing for the next itration
        itr=itr-1 ;                    %preparing for the next itration

    otherwise
        fprintf('Error! Program is terminating.\n')
        return
  end
end
    %concatination
    out =[ t; y];
 
    
    
    
 %displayin the output and plotting 
    fprintf('Here is your output (the first column is the values of t and the second column is the values of y) .\n')
    out=out' ;                                  %matrix transposing
    
    switch choose
        
         case 1                                 %Example 3 in lec  11 dr sara  _ Heun's method 
                 out=out(2:end ,:)              %displayin the output


         case 2                                 % Question 4 in sheet3  dr sara  _ Heun's method 
                %the last remaining itration
                y_diff=(y0^a)+b;                 %eq
                y1=y0+(h*y_diff);                %Predictor

                y1=(y1^a)+b;                     %updating y1
                t1=t0+h;                         %updating t

                y1=y0+((h/2)*(y_diff + y1));     %corrector 

                y(i+1)=y1;                       %saving output
                t(i+1)=t1;                       %saving output

                out =[ t; y];                  %concatination
                out                            %displaying the output 
                
           case 3                              % Question 3 in sheet3  dr sara  _ Heun's method 
                out=out(2:end ,:)
    end
                figure
                plot (t,y,'b') 
                hold on
                plot (t,y,'r*')
                title('Heun method "Improved Euler"')
                xlabel('t values');
                ylabel('y values');
                
    %%%%%%%%%%%%%%%%%%%%  finally I finished! it's done, thanks to Allah ^^   %%%%%%%%%%%%%%%%%






