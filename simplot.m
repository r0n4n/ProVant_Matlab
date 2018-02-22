function simplot( data,vect,struct , Np)
% SIMPLOT create a subplot figure with data types given in input. It uses
% the Struct_array global variable created by the Data_reader file. So run
% this script before. 
% 
% * DATA  is a cell array of the data you want to display (x,y,yaw... ) 
% * VECT is the vector from where you want to get the data (input, output, ref... ) 
% * STRUCT is a cell array of the names of the simulation that you want to
%   display (HIL, SIL) several simulation data can be print in same time
%   for camparaison 
% * Np is an optional variable. It is the number of point you want to
%   display. By default it is the maximum


global Struct_array

for i=1:length(data)
      
    
    sizeArray =zeros(1,length(struct)+2) ;
    for j=1:length(struct)
        
        array = Struct_array.(struct{j}).(vect).(data{i}) ;
        sizeArray(j) = length(array) ;
    end
    sizeArray(j+1) = length(Struct_array.(struct{j}).time) ;
    
    if ~exist('Np','var')
        % third parameter does not exist, so default it to something
        Np = length(Struct_array.(struct{j}).time);
    end
    sizeArray(j+2) = Np ; 
    N=min(sizeArray) ;
    
    subplot(length(data),1,i)
            for j=1:length(struct)
                array = Struct_array.(struct{j}).(vect).(data{i})  ;
                plot(Struct_array.(struct{j}).time(1:N),array(1:N))
                hold on
                %legend(struct{j}) ;
            end
    
%     plot(Struct_array.(struct{1}).time,findfield(Struct_array.(struct{1}).(vect),data{i}))
%     hold on
%     plot(Struct_array.(struct{2}).time,findfield(Struct_array.(struct{2}).(vect),data{i}))
     ylabel(data{i})
     xlabel('time (s)')
%     legend(struct{1},struct{2})
%     %end
end

end


