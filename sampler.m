function output = sampler( T , bool )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    decimator = 0 ; 
    if (bool == true)
        if mod(decimator,T) == 0 
            output = true ;
        else output = false ;
        end 
    else output = false ;
    end 
    

end

