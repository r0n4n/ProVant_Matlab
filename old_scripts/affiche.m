function affiche( data,vect,struct , Np)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global Struct_array



for i=1:length(data)
    %     s = findfield(Struct_array.(struct{1}),data{i}) ;
    %     if (isstruct(s))
    %         fields = fieldnames (s)
    %         for j=1:length(fields)
    %             affiche(fields,struct) ;
    %         end
    %     else
    
    
    sizeArray =zeros(1,length(struct)+2) ;
    for j=1:length(struct)
        
        array = findfield(Struct_array.(struct{j}).(vect),data{i}) ;
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
                array = findfield(Struct_array.(struct{j}).(vect),data{i})  ;
                plot(Struct_array.(struct{j}).time(1:N),array(1:N))
                hold on
                %legend(struct{j}) ;
            end
    
%     plot(Struct_array.(struct{1}).time,findfield(Struct_array.(struct{1}).(vect),data{i}))
%     hold on
%     plot(Struct_array.(struct{2}).time,findfield(Struct_array.(struct{2}).(vect),data{i}))
     ylabel(data{i})
%     legend(struct{1},struct{2})
%     %end
end

end


