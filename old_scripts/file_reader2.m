%% VANT 2.0 WITHOUT LOAD %% 
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

clear Struct_array 
close all

index.input.position.x= 1 ; 
index.input.position.y = 2 ; 
index.input.position.z = 3 ; 
index.input.angle.roll = 4 ;
index.input.angle.pitch = 5 ; 
index.input.angle.yaw = 6 ; 
index.input.servoPos.right = 7 ; 
index.input.servoPos.left = 8 ; 
index.input.velocity.dotx= 9 ; 
index.input.velocity.doty= 10 ; 
index.input.velocity.dotz = 11 ; 
index.input.dotAngle.dotroll = 12 ; 
index.input.dotAngle.dotpitch = 13 ; 
index.input.dotAngle.dotyaw = 14 ; 
index.input.servoVelocity.dotright = 15 ; 
index.input.servoVelocity.dotleft = 16 ; 
index.input.integ.xint = 17 ;
index.input.integ.yint = 18 ;
index.input.integ.zint = 19 ;
index.input.integ.yawint = 12 ;

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

