function FieldResult = findfield (inStruct, fieldName)
% inStruct is the name of the structure or an array of structures to search
% fieldName is the name of the field for which the function searches

f = fieldnames(inStruct(1));
FieldResult = 0 ; 
for i=1:length(f)
    if(strcmp(f{i},strtrim(fieldName)))
        FieldResult =inStruct(1).(f{i}) ;
        return;
    elseif isstruct(inStruct(1).(f{i}))
        FieldResult = findfield(inStruct(1).(f{i}), fieldName) ; 
        if (length(FieldResult)>1)    
            return; 
        end
    end 
end

return 
end

