
% 	* 0 - x position
% 	* 1 - y position
% 	* 2 - z position
% 	* 3 - Euler x angle (roll)
% 	* 4 - Euler y angle (pitch)
% 	* 5 - Euler z angle (yaw)
% 	* 6 - Right servo motor angle
% 	* 7 - Left servo motor angle  
% 	* 8 - x linear velocity
% 	* 9 - y linear velocity
% 	* 10 - z linear velocity
% 	* 11 - x angular velocity
% 	* 12 - y angular velocity
% 	* 13 - z angular velocity  
% 	* 14 - Right servo motor velocity
% 	* 15 - Left servo motor velocity


%% get the data files 

% HIL simulation 
output_HIL=csvread('HIL_data\out.txt') ; 
input_HIL=csvread('HIL_data\in.txt') ;
err_HIL =[] ; 
timeIn_HIL=csvread('HIL_data\tIn.txt') ;
%timeOut_HIL=csvread('HIL_data\tOut.txt') ;
timeOut_HIL = timeIn_HIL ; 
%deltaClock_HIL =  csvread('HIL_data\deltaClock.txt') ;

%%
% SIL simulation
output_SIL=csvread('SIL_data\out.txt') ; 
input_SIL=csvread('SIL_data\in.txt') ; 
ref_SIL=csvread('SIL_data\ref.txt') ;
timeIn_SIL=csvread('SIL_data\tIn.txt') ;
%timeOut_SIL=csvread('SIL_data\tOut.txt') ;
timeOut_SIL = timeIn_SIL ; 
err_SIL = csvread('SIL_data\erro.txt') ; 
%deltaClock_SIL =  csvread('SIL_data\deltaClock.txt') ;

% MIL simulation 
X =load('X.mat') ; 
output = load('outputs.mat') ;
timensec = load('timensec.mat') ; 
timesec = load('timesec.mat') ; 
err =  load('erro.mat') ; 
X_MIL=X.x(2:end,:) ; 
timeIn_MIL = timesec.data(2,:) +  timensec.data(2,:)/10^9 ; 
output_MIL = output.data(2:end,:) ; 
err_MIL = err.erro(2:end,:) ; 

%%
% get state vector SIL

x_position_SIL = input_SIL(:,1) ;
y_position_SIL = input_SIL(:,2) ; 
z_position_SIL = input_SIL(:,3) ;

roll_SIL = input_SIL(:,4) ;
pitch_SIL = input_SIL(:,5) ;
yaw_SIL = input_SIL(:,6) ;
alphar_SIL = input_SIL(:,7) ;
alphal_SIL = input_SIL(:,8) ;
x_velocity_SIL = input_SIL(:,9) ;
y_velocity_SIL = input_SIL(:,10) ;
z_velocity_SIL = input_SIL(:,11) ;
dotroll_SIL = input_SIL(:,12) ;
dotpitch_SIL = input_SIL(:,13) ;
dotyaw_SIL = input_SIL(:,14) ;
dot_alphar_SIL = input_SIL(:,15) ;
dot_alphal_SIL = input_SIL(:,16) ;
x_position_int_SIL = input_SIL(:,17) ;
y_position_int_SIL = input_SIL(:,18) ; 
z_position_int_SIL = input_SIL(:,19) ;
yaw_int_SIL = input_SIL(:,20) ;

%% get state vector HIL 

x_position_HIL = input_HIL(:,1) ;
y_position_HIL = input_HIL(:,2) ; 
z_position_HIL = input_HIL(:,3) ;

roll_HIL = input_HIL(:,4) ;
pitch_HIL = input_HIL(:,5) ;
yaw_HIL = input_HIL(:,6) ;
alphar_HIL = input_HIL(:,7) ;
alphal_HIL = input_HIL(:,8) ;
x_velocity_HIL = input_HIL(:,9) ;
y_velocity_HIL = input_HIL(:,10) ;
z_velocity_HIL = input_HIL(:,11) ;
dotroll_HIL = input_HIL(:,12) ;
dotpitch_HIL = input_HIL(:,13) ;
dotyaw_HIL = input_HIL(:,14) ;
dot_alphar_HIL = input_HIL(:,15) ;
dot_alphal_HIL = input_HIL(:,16) ;

% get state vector MIL 
x_position_MIL = X_MIL(1,:) ;
y_position_MIL = X_MIL(2,:) ; 
z_position_MIL = X_MIL(3,:) ;
roll_MIL = X_MIL(4,:) ;
pitch_MIL = X_MIL(5,:) ;
yaw_MIL = X_MIL(6,:) ;
alphar_MIL = X_MIL(7,:) ;
alphal_MIL = X_MIL(8,:) ;
x_velocity_MIL = X_MIL(9,:) ;
y_velocity_MIL = X_MIL(10,:) ;
z_velocity_MIL = X_MIL(11,:) ;
dotroll_MIL = X_MIL(12,:) ;
dotpitch_MIL = X_MIL(13,:) ;
dotyaw_MIL = X_MIL(14,:) ;
dot_alphar_MIL = X_MIL(15,:) ;
dot_alphal_MIL = X_MIL(16,:) ; 
x_position_int_MIL = X_MIL(17,:) ;
y_position_int_MIL = X_MIL(18,:) ; 
z_position_int_MIL = X_MIL(19,:) ;
yaw_int_MIL = X_MIL(20,:) ;

% get the control ouput SIL

Thrustdir_SIL=output_SIL(:,1) ; 
Thrustesq_SIL=output_SIL(:,2) ; 
RefaR_SIL=output_SIL(:,3) ;
RefaL_SIL=output_SIL(:,4) ;

% get the control ouput HIL
Thrustdir_HIL=output_HIL(:,1) ; 
Thrustesq_HIL=output_HIL(:,2) ; 
RefaR_HIL=output_HIL(:,3) ;
RefaL_HIL=output_HIL(:,4) ;

%% get the control ouput MIL
Thrustdir_MIL=output_MIL(1,:) ; 
Thrustesq_MIL=output_MIL(2,:) ; 
RefaR_MIL=output_MIL(3,:) ;
RefaL_MIL=output_MIL(4,:) ;
%% get ref SIL 

z_ref_SIL = ref_SIL(:,3) ; 

%% error SIL 


err_x_position_SIL = err_SIL(:,1) ;
err_y_position_SIL = err_SIL(:,2) ; 
err_z_position_SIL = err_SIL(:,3) ;
err_roll_SIL = err_SIL(:,4) ;
err_pitch_SIL = err_SIL(:,5) ;
err_yaw_SIL = err_SIL(:,6) ;

err_alphar_SIL = err_SIL(:,7) ;
err_alphal_SIL = err_SIL(:,8) ;
err_x_velocity_SIL = err_SIL(:,9) ;
err_y_velocity_SIL = err_SIL(:,10) ;
err_z_velocity_SIL = err_SIL(:,11) ;
err_dotroll_SIL = err_SIL(:,12) ;
err_dotpitch_SIL = err_SIL(:,13) ;
err_dotyaw_SIL = err_SIL(:,14) ;
err_dot_alphar_SIL = err_SIL(:,15) ;
err_dot_alphal_SIL = err_SIL(:,16) ;
err_x_position_int_SIL = err_SIL(:,17) ;
err_y_position_int_SIL = err_SIL(:,18) ; 
err_z_position_int_SIL = err_SIL(:,19) ;
err_yaw_int_SIL = input_SIL(:,20) ;

%% error MIL 


err_x_position_MIL = err_MIL(1,:) ;
err_y_position_MIL = err_MIL(2,:) ; 
err_z_position_MIL = err_MIL(3,:) ;
err_roll_MIL = err_MIL(4,:) ;
err_pitch_MIL = err_MIL(5,:) ;
err_yaw_MIL = err_MIL(:,6) ;

err_alphar_MIL = err_MIL(:,7) ;
err_alphal_MIL = err_MIL(:,8) ;
err_x_velocity_MIL = err_MIL(:,9) ;
err_y_velocity_MIL = err_MIL(:,10) ;
err_z_velocity_MIL = err_MIL(:,11) ;
err_dotroll_MIL = err_MIL(:,12) ;
err_dotpitch_MIL = err_MIL(:,13) ;
err_dotyaw_MIL = err_MIL(:,14) ;
err_dot_alphar_MIL = err_MIL(:,15) ;
err_dot_alphal_MIL = err_MIL(:,16) ;
err_x_position_int_MIL = err_MIL(:,17) ;
err_y_position_int_MIL = err_MIL(:,18) ; 
err_z_position_int_MIL = err_MIL(:,19) ;
err_yaw_int_MIL = err_MIL(:,20) ;


%%
N= min(length(Thrustdir_SIL),length(Thrustdir_HIL)); % size of analyze 
N = min(N,length(Thrustdir_MIL)) ; 