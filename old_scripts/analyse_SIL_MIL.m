%% Position 

affiche({'x','y','z'},'input',{'MIL'})

%% attitude 

affiche({'pitch','roll','yaw'},'input',{'MIL'})

%% output 

affiche({'Thrustdir','Thrustesq','RefaL','RefaR'},'output',{'MIL'})


%% UAV attitude 

figure
subplot(3,1,1)
plot(timeIn_SIL(1:N),roll_SIL(1:N),'r*') ; 
hold on 
plot(timeIn_MIL(1:N),roll_MIL(1:N),'c*') ;
legend('SIL','MIL') ;
ylabel('roll') ; 
subplot(3,1,2)
plot(timeIn_SIL(1:N),pitch_SIL(1:N),'r*') ; 
hold on 
plot(timeIn_MIL(1:N),pitch_MIL(1:N),'c*') ;
legend('SIL','MIL') ;
ylabel('pitch') ;
subplot(3,1,3)
plot(timeIn_SIL(1:N),yaw_SIL(1:N),'r*') ;
hold on 
plot(timeIn_MIL(1:N),yaw_MIL(1:N),'c*') ;
legend('SIL','MIL') ;
ylabel('yaw') ;

%% UAV position 

figure 
subplot(3,1,1)
plot(timeIn_SIL(1:N),x_position_SIL(1:N)) ;
hold on 
plot(timeIn_MIL(1:N),x_position_MIL(1:N)) ; 
legend('SIL','MIL') ;
ylabel('x position') ; 
subplot(3,1,2)
plot(timeIn_SIL(1:N),y_position_SIL(1:N)) ;
hold on
plot(timeIn_MIL(1:N),y_position_MIL(1:N)) ; 
legend('SIL','MIL') ;
ylabel('y position') ;
subplot(3,1,3)
plot(timeIn_SIL(1:N),z_position_SIL(1:N)) ;
hold on 
plot(timeIn_MIL(1:N),z_position_MIL(1:N)) ;
legend('SIL','MIL') ;
ylabel('z position') ;

%% Servo behavior 
subplot(2,1,1)
plot(timeIn_SIL(1:N),alphar_SIL(1:N)) ; 
hold on 
plot(timeIn_MIL(1:N),alphar_MIL(1:N)) ; 
legend('SIL','MIL') ;
ylabel('Servo right angle') ; 
subplot(2,1,2)
plot(timeIn_SIL(1:N),alphal_SIL(1:N)) ;
hold on 
plot(timeIn_MIL(1:N),alphal_MIL(1:N)) ; 
legend('SIL','MIL') ;
ylabel('Servo left angle') ;

%% Integrations

figure
subplot(4,1,1)
plot(timeIn_SIL(1:N),x_position_int_SIL(1:N),'c*') ; 
hold on 
plot(timeIn_MIL(1:N),x_position_int_MIL(1:N),'r*') ; 
legend('SIL','MIL') ; 
ylabel('x_position_int') ; 
subplot(4,1,2)
plot(timeIn_SIL(1:N),y_position_int_SIL(1:N),'c*') ; 
hold on
plot(timeIn_MIL(1:N),y_position_int_MIL(1:N),'r*') ; 
legend('SIL','MIL') ;
ylabel('y_position_int') ;
subplot(4,1,3)
plot(timeIn_SIL(1:N),z_position_int_SIL(1:N),'c*') ;
hold on 
plot(timeIn_MIL(1:N),z_position_int_MIL(1:N),'r*') ;
legend('SIL','MIL') ;
ylabel('z_position_int') ; 
subplot(4,1,4)
plot(timeIn_SIL(1:N),yaw_int_SIL(1:N),'c*') ;
hold on 
plot(timeIn_MIL(1:N),yaw_int_MIL(1:N),'r*') ;
legend('SIL','MIL') ;
ylabel('yaw_int') ;

%% Error position 


figure 
subplot(3,1,1)
plot(timeIn_SIL(1:N),err_x_position_SIL(1:N)) ;
hold on 
plot(timeIn_MIL(1:N),err_x_position_MIL(1:N)) ; 
legend('SIL','MIL') ;
ylabel('error x position') ; 
subplot(3,1,2)
plot(timeIn_SIL(1:N),err_y_position_SIL(1:N)) ;
hold on
plot(timeIn_MIL(1:N),err_y_position_MIL(1:N)) ; 
legend('SIL','MIL') ;
ylabel('error y position') ;
subplot(3,1,3)
plot(timeIn_SIL(1:N),err_z_position_SIL(1:N)) ;
hold on 
plot(timeIn_MIL(1:N),err_z_position_MIL(1:N)) ;
legend('SIL','MIL') ;
ylabel('error z position') ;

%% Control Output 

%Thrusters control output 
figure
subplot(4,1,1)
plot(timeIn_SIL(1:N),Thrustdir_SIL(1:N),'c*') ; 
hold on 
plot(timeIn_MIL(1:N),Thrustdir_MIL(1:N),'r*') ; 
legend('SIL','MIL') ; 
ylabel('Thrustdir') ; 
subplot(4,1,2)
plot(timeIn_SIL(1:N),Thrustesq_SIL(1:N),'c*') ; 
hold on
plot(timeIn_MIL(1:N),Thrustesq_MIL(1:N),'r*') ; 
legend('SIL','MIL') ;
ylabel('Thrustesq') ;

% Servo control output 
subplot(4,1,3)
plot(timeIn_SIL(1:N),RefaR_SIL(1:N),'c*') ;
hold on 
plot(timeIn_MIL(1:N),RefaR_MIL(1:N),'r*') ;
legend('SIL','MIL') ;
ylabel('RefaR') ; 
subplot(4,1,4)
plot(timeIn_SIL(1:N),RefaL_SIL(1:N),'c*') ;
hold on 
plot(timeIn_MIL(1:N),RefaL_MIL(1:N),'r*') ;
legend('SIL','MIL') ;
ylabel('RefaL') ;

%% 

allpoints = load('seq.mat') ; 
samplepoints = load('seq2.mat') ; 


%% Sample points analyse 

plot(timeOut_SIL,'r*') 
hold on 
%%
plot(samplepoints.data(2,:),'c*') 
hold on 
plot(allpoints.data(2,:),'y*') 
legend('SIL','MIL','allpoints') ;
%%
sizeOfAllPoints = length(allpoints.data(2,:))
sizeOfMILsample = length(samplepoints.data(2,:))
sizeOfSILsample = length(timeOut_SIL) 

%% MIL subscribe analyse 
gapMIL=zeros(length(allpoints.data(2,:))-1,1) ; 
for i=1:length(allpoints.data(2,:))-1
    gapMIL(i) =allpoints.data(2,i+1)-allpoints.data(2,i) ;    
end 
plot(gapMIL)

%% 
plot(allpoints.data(2,:)) 

%% MIL sample analyse 

gapMIL=zeros(length(samplepoints.data(2,:))-1,1) ; 
for i=1:length(samplepoints.data(2,:))-1
    gapMIL(i) =samplepoints.data(2,i+1)-samplepoints.data(2,i) ;    
end 
plot(gapMIL)

%% SIL sample analyse 
gapSIL = zeros(length(timeOut_SIL),1) ; 
for i=1:length(timeOut_SIL)-1
    gapSIL(i) =timeOut_SIL(i+1)-timeOut_SIL(i) ;    
end 
plot(gapSIL)

%% 

gapMILAll=zeros(length(allpoints.data(2,:))-1,1) ; 
for i=1:length(allpoints.data(2,:))-1
    gapMILAll(i) =allpoints.data(2,i+1)-allpoints.data(2,i) ;    
end 
plot(gapMILAll)
%% 

gapMILAll=zeros(length(seqSimulink)-1,1) ; 
for i=1:length(seqSimulink)-1
    gapMILAll(i) =seqSimulink(i+1,2)-seqSimulink(i,2) ;    
end 
plot(gapMILAll)


