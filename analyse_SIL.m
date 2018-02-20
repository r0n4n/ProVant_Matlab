%% Script to analyse the SIL simulation 

%% Position 

simplot({'x','y','z'},'input',{'SIL'},50)

%% ref 
figure 
simplot({'x','y','z'},'ref',{'SIL'})


%% err 

simplot({'x','y','z'},'err',{'SIL'})

%% integ 

simplot({'xint','yint','zint'},'input',{'SIL'})

%% Z 

simplot({'z'},'input',{'SIL'})
%%
simplot({'z'},'ref',{'SIL'})
%%
simplot({'z'},'err',{'SIL'})
%%
simplot({'zint'},'input',{'SIL'})


%% X
simplot({'x'},'input',{'SIL'})

%%
simplot({'x'},'ref',{'SIL'})

%%
simplot({'x'},'err',{'SIL'})

%% Y
simplot({'y'},'input',{'SIL'})

%% 
simplot({'y'},'ref',{'SIL'})


%%
simplot({'yaw'},'err',{'SIL'})

%% Yaw
simplot({'yaw'},'input',{'SIL'})

%% 
simplot({'yaw'},'ref',{'SIL'})

%% Velocity 

simplot({'dotx','doty','dotz'},'input',{'SIL'})

%% 

simplot({'dotx','doty','dotz'},'ref',{'SIL'})

%% Control ouputs 

simplot({'Thrustdir','Thrustesq','RefaR','RefaL'},'output',{'SIL'})
legend('SIL')
