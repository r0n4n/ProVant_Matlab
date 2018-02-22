

%% UAV position 
simplot({'x','y','z'},'input',{'SIL','HIL'})
legend('SIL','HIL')

%% Compare the position with the reference 

subplot(3,1,1) 
plot(Struct_array.HIL.time,Struct_array.HIL.input.x) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.input.x) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.ref.x) ; 
legend('HIL','SIL','ref')
ylabel('x')
xlabel('time (s)')
subplot(3,1,2) 
plot(Struct_array.HIL.time,Struct_array.HIL.input.y) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.input.y) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.ref.y) ; 
legend('HIL','SIL','ref')
ylabel('y')
xlabel('time (s)')
subplot(3,1,3) 
plot(Struct_array.HIL.time,Struct_array.HIL.input.z) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.input.z) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.ref.z) ; 
legend('HIL','SIL','ref')
ylabel('z')
xlabel('time (s)')

%% Compare the position with the reference 

subplot(2,1,1) 
plot(Struct_array.HIL.input.x,Struct_array.HIL.input.y) ; 
hold on 
plot(Struct_array.SIL.input.x,Struct_array.SIL.input.y) ;
hold on 
plot(Struct_array.SIL.ref.x,Struct_array.SIL.ref.y) ; 
legend('HIL','SIL','ref')
xlabel('x')
ylabel('y')
subplot(2,1,2)  
plot(Struct_array.HIL.time,Struct_array.HIL.input.z) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.input.z) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.ref.z) ; 
legend('HIL','SIL','ref')
ylabel('z')
xlabel('time (s)')

%% XY trajectory with  SIL ref
plot(Struct_array.HIL.input.x,Struct_array.HIL.input.y) ; 
hold on 
plot(Struct_array.SIL.input.x,Struct_array.SIL.input.y) ;
hold on 
plot(Struct_array.SIL.ref.x,Struct_array.SIL.ref.y) ; 
legend('HIL','SIL','ref')
xlabel('x')
ylabel('y')

%% altitude 
plot(Struct_array.HIL.time,Struct_array.HIL.input.z) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.input.z) ; 
hold on 
plot(Struct_array.SIL.time,Struct_array.SIL.ref.z) ; 
legend('HIL','SIL','ref')
ylabel('z')
xlabel('time (s)')

%% UAV attitude 

simplot({'roll','pitch','yaw'},'input',{'SIL','HIL'})
legend('SIL','HIL')

%% Control Output 

simplot({'Thrustdir','Thrustesq','RefaR','RefaL'},'output',{'SIL','HIL'})
legend('SIL','HIL')

%% Thrusts 
simplot({'Thrustdir','Thrustesq'},'output',{'SIL','HIL'},10)
legend('SIL','HIL')