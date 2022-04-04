format long %i changed it to long because the default matlab formating is short.. so the differences between each itrations would not be shown to dr.sara, unless the formattings are manually adjusted to be long 
clear all
clc

%initialization and definitions:
    %our users are asked to Enter their data about the 3-unknown linear system equations 
        A=input('Please enter your "coeff strictly diagonal matrix" like this ex: [ 27 6 -1; 6 15 2 ; 1 1 54] \n');
        B=input('please enter your "constants free terms matrix" like this ex: [85; 72; 110] \n');
        x=input('please enter your initial guess like this ex: [0; 0; 0] \n ');
        desired_error= input('please enter your desired max error(ex: 1e-5 or 10^-5 )the program will end and display the solutions after reaching your max error\n');
        itr_guess= input('please enter your expected num of iteration..if the program reached the max error, it will end and display the solution \n');
        
        n=size(A,1);           %initializing num of eq equal to num of unknowns
        error= Inf;            %initialize as positve infinity
        itr=0;                 %initialize iterations counter as 0
        
        
%code:
    while (  all(error> desired_error)    )
        xold=x;
        for i=1:n
            sum=0;
            for j=1:n
                if j~=i
                    sum= sum + A(i,j) *xold(j);      %summing the remaining other Xs as i=num of row , j=num of columns
                end
            end 
            x(i)= (1/A(i,i))*(B(i)-sum)              %jacobi method (the main updation of X using the above summing)
        end
        itr=itr+1;
        y(itr,:)=x;
        error= abs(xold-x);
    end
    
    
    
    %printing num of itrations 
            if (itr == itr_guess) 
                 fprintf('jacobi method converge to the required solution after an actual num of itrations equal to an expected num of itrations n= %i \n', itr);
            elseif ( itr < itr_guess )
                 fprintf('jacobi method converge to the required solution after an actual num of itrations ( %i ) which is smaller than the expected num of itrations ( %i ) \n', itr, itr_guess);
            elseif (itr > itr_guess)
                 fprintf('jacobi method converge to the required solution after an actual num of itrations ( %i ) which is greater than the expected num of itrations ( %i ) \n', itr, itr_guess);
            end 
            
            
     %printing the final solution
            fprintf('the required unknowns solution of the X matrix is: ');
            disp(x)