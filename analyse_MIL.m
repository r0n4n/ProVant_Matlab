%% Script to analyse the MIL simulation 

%% Position 

simplot({'x','y','z'},'input',{'MIL'})

%% ref 
figure 

simplot({'x','y','z'},'ref',{'MIL'})


%% err 

simplot({'x','y','z'},'err',{'MIL'})

%% integ 

simplot({'xint','yint','zint'},'input',{'MIL'})

%% Z 

simplot({'z'},'input',{'MIL'})
%%
simplot({'z'},'ref',{'MIL'})
%%
simplot({'z'},'err',{'MIL'})
%%
simplot({'zint'},'input',{'MIL'})


%% X
simplot({'x'},'input',{'MIL'})

%%
simplot({'x'},'ref',{'MIL'})

%%
simplot({'x'},'err',{'MIL'})

%% Y
simplot({'y'},'input',{'MIL'})

%% 
simplot({'y'},'ref',{'MIL'})
%%

%%
simplot({'yaw'},'err',{'MIL'})

%% Yaw
simplot({'yaw'},'input',{'MIL'})

%% 
simplot({'yaw'},'ref',{'MIL'})

%%

simplot({'dotx','doty','dotz'},'input',{'MIL'})

%% This 
diff = zeros(length(seq)-1,1) ; 
for i=1:length(seq)-1
    diff(i) = seq(i+1)-seq(i) ; 
end 
plot(diff) 