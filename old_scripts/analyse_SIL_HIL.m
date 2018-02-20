affiche({'x','y','z'},'input',{'SIL','HIL'})
legend('SIL','HIL')

%% UAV position 

figure('Name','Position')  
subplot(3,1,1)
plot(timeIn_SIL(1:N),x_position_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),x_position_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('x position') ; 
subplot(3,1,2)
plot(timeIn_SIL(1:N),y_position_SIL(1:N)) ;
hold on
plot(timeIn_HIL(1:N),y_position_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('y position') ;
subplot(3,1,3)
plot(timeIn_SIL(1:N),z_position_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),z_position_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('z position') ;

%% UAV attitude 

figure
subplot(3,1,1)
plot(timeIn_SIL(1:N),roll_SIL(1:N)) ; 
hold on 
plot(timeIn_HIL(1:N),roll_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('roll') ; 
subplot(3,1,2)
plot(timeIn_SIL(1:N),pitch_SIL(1:N)) ; 
hold on 
plot(timeIn_HIL(1:N),pitch_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('pitch') ;
subplot(3,1,3)
plot(timeIn_SIL(1:N),yaw_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),yaw_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('yaw') ;

%% Control Output 

%Thrusters control output 
figure
subplot(4,1,1)
plot(timeOut_SIL(1:N),Thrustdir_SIL(1:N),'c*') ; 
hold on 
plot(timeOut_HIL(1:N),Thrustdir_HIL(1:N),'r*') ; 
legend('SIL','HIL') ; 
ylabel('Thrustdir') ; 
subplot(4,1,2)
plot(timeOut_SIL(1:N),Thrustesq_SIL(1:N),'c*') ; 
hold on
plot(timeOut_HIL(1:N),Thrustesq_HIL(1:N),'r*') ; 
legend('SIL','HIL') ;
ylabel('Thrustesq') ;

% Servo control output 
subplot(4,1,3)
plot(timeOut_SIL(1:N),RefaR_SIL(1:N),'c*') ;
hold on 
plot(timeOut_HIL(1:N),RefaR_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaR') ; 
subplot(4,1,4)
plot(timeOut_SIL(1:N),RefaL_SIL(1:N),'c*') ;
hold on 
plot(timeOut_HIL(1:N),RefaL_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaL') ;

%% Servo control output 
subplot(2,1,1)
plot(timeOut_SIL(1:N),RefaR_SIL(1:N),'c*') ;
hold on 
plot(timeOut_HIL(1:N),RefaR_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaR') ; 
subplot(2,1,2)
plot(timeOut_SIL(1:N),RefaL_SIL(1:N),'c*') ;
hold on 
plot(timeOut_HIL(1:N),RefaL_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaL') ;

%% Servo behavior 
subplot(2,1,1)
plot(timeIn_SIL(1:N),alphar_SIL(1:N)) ; 
hold on 
plot(timeIn_HIL(1:N),alphar_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('Servo right angle') ; 
subplot(2,1,2)
plot(timeIn_SIL(1:N),alphal_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),alphal_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('Servo left angle') ;
%%
figure 
plot(timeOut_SIL,z_ref_SIL) ; 

%%
plot(timeOut_HIL(1:N),RefaL_HIL(1:N),'c*') ;

%% Control analyze 1

% UAV position 
subplot(5,1,1)
plot(timeIn_SIL(1:N),x_position_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),x_position_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('x position') ; 
subplot(5,1,2)
plot(timeIn_SIL(1:N),y_position_SIL(1:N)) ;
hold on
plot(timeIn_HIL(1:N),y_position_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('y position') ;
subplot(5,1,3)
plot(timeIn_SIL(1:N),z_position_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),z_position_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('z position') ;

% Thrusters control output 
subplot(5,1,4)
plot(timeOut_SIL(1:N),Thrustdir_SIL(1:N)) ; 
hold on 
plot(timeOut_HIL(1:N),Thrustdir_HIL(1:N)) ; 
legend('SIL','HIL') ; 
ylabel('Thrustdir') ; 
subplot(5,1,5)
plot(timeOut_SIL(1:N),Thrustesq_SIL(1:N)) ; 
hold on
plot(timeOut_HIL(1:N),Thrustesq_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('Thrustesq') ;

%% Control analyze 2

% UAV position 
figure 
subplot(5,1,1)
plot(timeIn_SIL(1:N),x_position_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),x_position_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('x position') ; 
subplot(5,1,2)
plot(timeIn_SIL(1:N),y_position_SIL(1:N)) ;
hold on
plot(timeIn_HIL(1:N),y_position_HIL(1:N)) ; 
legend('SIL','HIL') ;
ylabel('y position') ;
subplot(5,1,3)
plot(timeIn_SIL(1:N),z_position_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),z_position_HIL(1:N)') ;
legend('SIL','HIL') ;
ylabel('z position') ;

% Servo control output 

subplot(5,1,4)
plot(timeOut_SIL(1:N),RefaR_SIL(1:N)) ;
hold on 
plot(timeOut_HIL(1:N),RefaR_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('RefaR') ; 
subplot(5,1,5)
plot(timeOut_SIL(1:N),RefaL_SIL(1:N)) ;
hold on 
plot(timeOut_HIL(1:N),RefaL_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('RefaL') ;

%% Control analyze 3

% UAV attitude 

figure
subplot(5,1,1)
plot(timeIn_SIL(1:N),roll_SIL(1:N),'c*') ; 
hold on 
plot(timeIn_HIL(1:N),roll_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('roll') ; 
subplot(5,1,2)
plot(timeIn_SIL(1:N),pitch_SIL(1:N)) ; 
hold on 
plot(timeIn_HIL(1:N),pitch_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('pitch') ;
subplot(5,1,3)
plot(timeIn_SIL(1:N),yaw_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),yaw_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('yaw') ;

% Servo control output 
subplot(5,1,4)
plot(timeOut_SIL(1:N),RefaR_SIL(1:N),'c*') ;
hold on 
plot(timeOut_HIL(1:N),RefaR_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaR') ; 
subplot(5,1,5)
plot(timeOut_SIL(1:N),RefaL_SIL(1:N)) ;
hold on 
plot(timeOut_HIL(1:N),RefaL_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('RefaL') ;

%% Control analyze 4

% UAV attitude 
figure  
subplot(3,1,1)
plot(timeIn_SIL(1:N),pitch_SIL(1:N)) ; 
hold on 
plot(timeIn_HIL(1:N),pitch_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('pitch') ;

% Servo control output 
subplot(3,1,2)
plot(timeOut_SIL(1:N),RefaR_SIL(1:N)) ;
hold on 
plot(timeOut_HIL(1:N),RefaR_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('RefaR') ; 
subplot(3,1,3)
plot(timeOut_SIL(1:N),RefaL_SIL(1:N)) ;
hold on 
plot(timeOut_HIL(1:N),RefaL_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('RefaL') ;

%% Control analyze 5

% UAV attitude 

figure
subplot(4,1,1)
plot(timeIn_SIL(1:N),roll_SIL(1:N),'c*') ; 
hold on 
plot(timeIn_HIL(1:N),roll_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('roll') ; 
subplot(4,1,2)
plot(timeIn_SIL(1:N),pitch_SIL(1:N)) ; 
hold on 
plot(timeIn_HIL(1:N),pitch_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('pitch') ;
subplot(4,1,3)
plot(timeIn_SIL(1:N),yaw_SIL(1:N)) ;
hold on 
plot(timeIn_HIL(1:N),yaw_HIL(1:N)) ;
legend('SIL','HIL') ;
ylabel('yaw') ;

% Servo control output 
subplot(4,1,4)
plot(timeIn_HIL(1:N),deltaClock_HIL(1:N))




%% Reference 

figure 
plot(timeIn_SIL(1:N),z_ref_SIL(1:N)) ; 

%% Time compare HIL/SIL
figure 
plot(timeOut_SIL) ;
hold on 
plot(timeOut_HIL) ; 

%% Time in/out SIL 
figure 
plot(timeIn_SIL(1:N),'c*') ;
hold on 
plot(timeOut_SIL(1:N),'r*') ; 

%% Time in/out HIL 
plot(timeIn_HIL(1:N),'c*') ;
hold on 
plot(timeOut_HIL(1:N),'r*') ; 


%% diff time out-in SIL and HIL

diffInOut = zeros(N,1) ; 
for i=1:N
    diffInOut(i) = timeOut_SIL(i) - timeIn_SIL(i) ; 
end 
plot(diffInOut) ;
hold on 

meanTimeContrSIL = mean (diffInOut) 

diffInOut = zeros(N,1) ; 
for i=1:N
    diffInOut(i) = timeOut_HIL(i)- timeIn_HIL(i) ; 
end 
plot(diffInOut) ;
legend('SIL','HIL') ;

meanTimeContrHIL = mean (diffInOut) 

%% diff time in-out SIL and HIL

diffInOut = zeros(N,1) ; 
for i=1:N-1
    diffInOut(i) = timeIn_SIL(i+1) - timeOut_SIL(i) ; 
end 
plot(diffInOut) ;
hold on 

meanTimeContrSIL = mean (diffInOut) 

diffInOut = zeros(N,1) ; 
for i=1:N-1
    diffInOut(i) = timeIn_HIL(i+1)- timeOut_HIL(i) ; 
end 
plot(diffInOut) ;
legend('SIL','HIL') ;

meanTimeContrHIL = mean (diffInOut) ; 
 
%% time in comparison HIL/SIL 
figure 
plot(timeIn_HIL(1:N)-timeIn_SIL(1:N)) ; 
%%
figure 
plot(timeIn_HIL) 
hold on 
plot(timeIn_SIL ) 
legend('SIL','HIL') ;

%% time average HIL
average = 0 ; 
for i=1:length(timeIn_HIL)-1
    average = average + timeIn_HIL(i+1)-timeIn_HIL(i) ; 
end 

average = average / (length(timeIn_HIL)-1) 

%% time average SIL
average = 0 ; 
for i=1:length(timeIn_SIL)-1
    diff = timeIn_SIL(i+1)-timeIn_SIL(i) ; 
    average = average +  diff ; 
end 

average = average / (length(timeIn_SIL)-1)
    
%% deltaClock HIL/SIL 

plot(timeIn_SIL(1:N),deltaClock_SIL(1:N)) 
hold on 
plot(timeIn_HIL(1:N),deltaClock_HIL(1:N))
legend('SIL','HIL') ; 

%% error 

plot(err_SIL(:,17))
hold on 
plot(err_SIL(:,18))
hold on 
plot(err_SIL(:,19))
hold on 
plot(err_SIL(:,20))
legend('xint','yint','zint','yawint') ;

%%
%% Compare controllers calculations HIL/SIL 

%Thrusters control output 
figure
subplot(4,1,1)
plot(timeIn_SIL(1:N),Thrustdir_SIL(1:N),'c*') ; 
hold on 
plot(timeIn_SIL(1:N),Thrustdir_HIL(1:N),'r*') ; 
%legend('SIL','HIL') ; 
ylabel('Thrustdir') ; 
subplot(4,1,2)
plot(timeIn_SIL(1:N),Thrustesq_SIL(1:N),'c*') ; 
hold on
plot(timeIn_SIL(1:N),Thrustesq_HIL(1:N),'r*') ; 
legend('SIL','HIL') ;
ylabel('Thrustesq') ;

% Servo control output 
subplot(4,1,3)
plot(timeIn_SIL(1:N),RefaR_SIL(1:N),'c*') ;
hold on 
plot(timeIn_SIL(1:N),RefaR_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaR') ; 
subplot(4,1,4)
plot(timeIn_SIL(1:N),RefaL_SIL(1:N),'c*') ;
hold on 
plot(timeIn_SIL(1:N),RefaL_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaL') ;

%% Control Output - Controller node  

%Thrusters control output 
figure
subplot(4,1,1)
plot(timeIn_SIL(1:N),Thrustdir_SIL(1:N)+1,'c*') ; 
hold on 
plot(timeIn_SIL(1:N),Thrustdir_HIL(1:N),'r*') ; 
legend('SIL','HIL') ; 
ylabel('Thrustdir') ; 
subplot(4,1,2)
plot(timeIn_SIL(1:N),Thrustesq_SIL(1:N)+1,'c*') ; 
hold on
plot(timeIn_SIL(1:N),Thrustesq_HIL(1:N),'r*') ; 
legend('SIL','HIL') ;
ylabel('Thrustesq') ;

% Servo control output 
subplot(4,1,3)
plot(timeIn_SIL(1:N),RefaR_SIL(1:N)+1,'c*') ;
hold on 
plot(timeIn_SIL(1:N),RefaR_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaR') ; 
subplot(4,1,4)
plot(timeIn_SIL(1:N),RefaL_SIL(1:N)+1,'c*') ;
hold on 
plot(timeIn_SIL(1:N),RefaL_HIL(1:N),'r*') ;
legend('SIL','HIL') ;
ylabel('RefaL') ;

