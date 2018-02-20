%% Position 

simplot({'x','y','z'},'input',{'SIL','MIL'})
legend('SIL','MIL')


%%

simplot({'xint','yint','zint','yawint'},'input',{'SIL','MIL'})
legend('SIL','MIL')
%% err 
simplot({'x','y','z'},'err',{'SIL','MIL'})
legend('SIL','MIL')

%% ref 
simplot({'x','y','z'},'ref',{'SIL','MIL'})
legend('SIL','MIL')
%% attitude 

simplot({'pitch','roll','yaw'},'input',{'MIL'})

%% output 

simplot({'Thrustdir','Thrustesq','RefaL','RefaR'},'output',{'SIL','MIL'})
legend('SIL','MIL')


