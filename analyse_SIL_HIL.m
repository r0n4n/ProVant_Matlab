

%% UAV position 
simplot({'x','y','z'},'input',{'SIL','HIL'})
legend('SIL','HIL')


%% UAV attitude 

simplot({'roll','pitch','yaw'},'input',{'SIL','HIL'})
legend('SIL','HIL')

%% Control Output 

simplot({'Thrustdir','Thrustesq','RefaR','RefaL'},'output',{'SIL','HIL'})
legend('SIL','HIL')


