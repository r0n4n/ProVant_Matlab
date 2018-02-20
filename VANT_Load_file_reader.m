%% VANT 2.0 WITH LOAD %% 
% This script manage the data of SIL and HIL of the VANT2.0 with load

% 	* 0 - x position
% 	* 1 - y position
% 	* 2 - z position
% 	* 3 - Euler x angle (roll)
% 	* 4 - Euler y angle (pitch)
% 	* 5 - Euler z angle (yaw)
%   * 6 - x load angle 
%   * 7 - y load angle 
% 	* 8 - Right servo motor angle
% 	* 9 - Left servo motor angle  
% 	* 10 - x linear velocity
% 	* 11 - y linear velocity
% 	* 12 - z linear velocity
% 	* 13 - x angular velocity
% 	* 14 - y angular velocity
% 	* 15 - z angular velocity  
%   * 16 - x load angular velocity 
%   * 17 - y load angular velocity 
% 	* 18 - Right servo motor velocity
% 	* 19 - Left servo motor velocity
%   * 20 - x integ 
%   * 21 - y integ
%   * 22 - z integ 
%   * 23 - yaw integ

clear Struct_array 
close all

index.input.position.x= 1 ; 
index.input.position.y = 2 ; 
index.input.position.z = 3 ; 
index.input.angle.roll = 4 ;
index.input.angle.pitch = 5 ; 
index.input.angle.yaw = 6 ; 
index.input.load.x_load_angle = 7 ; 
index.input.load.y_load_angle = 8 ; 
index.input.servoPos.right = 9 ; 
index.input.servoPos.left = 10 ; 
index.input.velocity.dotx= 11 ; 
index.input.velocity.doty= 12 ; 
index.input.velocity.dotz = 13 ; 
index.input.dotAngle.dotroll = 14 ; 
index.input.dotAngle.dotpitch = 15 ; 
index.input.dotAngle.dotyaw = 16 ; 
index.input.load.x_angular_velocity = 17 ; 
index.input.load.y_angular_velocity = 18 ; 
index.input.servoVelocity.dotright = 19 ; 
index.input.servoVelocity.dotleft = 20 ; 
index.input.integ.xint = 21 ;
index.input.integ.yint = 22 ;
index.input.integ.zint = 23 ;
index.input.integ.yawint = 24 ;

index.output.Thrustdir = 1 ; 
index.output.Thrustesq = 2 ; 
index.output.RefaR = 3 ;
index.output.RefaL = 4 ;
index.time = 1 ; 
index.ref = index.input ; 
index.err = index.input  ; 


s.output=[] ; 
s.input=[] ; 
s.ref=[] ; 
s.err=[] ; 
s.time=[] ; 


%% Structure creation 

global Struct_array 

% HIL simulation
Struct_array.HIL = s ; 
Struct_array.HIL.input=csvread('HIL_data\in.txt')'  ; 
Struct_array.HIL.output= csvread('HIL_data\out.txt')' ;
Struct_array.HIL.time=csvread('HIL_data\tIn.txt')' ;
Struct_array.HIL.err= [] ; 
Struct_array.HIL.ref= [] ; 

%% SIL simulation
Struct_array.SIL = s ;
Struct_array.SIL.input= csvread('SIL_data\in.txt')' ; 
Struct_array.SIL.output= csvread('SIL_data\out.txt')' ;
Struct_array.SIL.time=csvread('SIL_data\tIn.txt')' ;
Struct_array.SIL.err= csvread('SIL_data\erro.txt')' ; 
Struct_array.SIL.ref= csvread('SIL_data\ref.txt')' ;  

% % MIL simulation 
% X =load('X.mat') ; 
% output = load('outputs.mat') ;
% timensec = load('timensec.mat') ; 
% timesec = load('timesec.mat') ; 
% err =  load('erro.mat') ; 
% Struct_array.MIL = s ;
% Struct_array.MIL.input= X.x(2:end,:) ; 
% Struct_array.MIL.output= output.data(2:end,:) ;
% Struct_array.MIL.time=timesec.data(2,:) +  timensec.data(2,:)/10^9 ; 
% Struct_array.MIL.err= err.erro(2:end,:) ;
% Struct_array.MIL.ref= [] ;
% clear X ouput timensec timesec erro 

%%

struct_fields = fieldnames (Struct_array) ;
for k=1:length(struct_fields) %% HIL, SIL ... 
    struct_fields{k} ; 
    array_fields = fieldnames (s) ;
    for i=1:length(array_fields)  %% input, output... 
        if (isstruct(index.(array_fields{i}))&& length(Struct_array.(struct_fields{k}).(array_fields{i}))~=0)
            %array_fields{i}  
            fields = fieldnames (index.(array_fields{i}))  ;
            array = Struct_array.(struct_fields{k}).(array_fields{i}) ;
            Struct_array.(struct_fields{k}).(array_fields{i}) = struct ;  
            for j=1:length(fields) %% x position          
                if (isstruct(index.(array_fields{i}).(fields{j})))
                    subfields = fieldnames (index.(array_fields{i}).(fields{j}))  ;
                    %fields{j}
                    for l=1:length(subfields)
                        %subfields{l}
                        
                        [Struct_array.(struct_fields{k}).(array_fields{i}).(fields{j}).(subfields{l})] = array(index.(array_fields{i}).(fields{j}).(subfields{l}),:) ;
                    end 
                else 
                    [Struct_array.(struct_fields{k}).(array_fields{i}).(fields{j})] = array(index.(array_fields{i}).(fields{j}),:) ;
                end    
            end 
         end         
    end 
    %(struct_fields{k}) = struct 
    %Struct_array.(struct_fields{k}) ; 
end 

clear struct_fields array_fields fields subfields array

