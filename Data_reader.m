%% This script take the data from the HIL, SIL and MIL files to format them and create one structure containing all the data formated 

clear Struct_array 
%clear all 

%% Set the type of the model : the state vector is not the same 

%model = 'VANT2.0 with load' ;  
model = 'VANT2.0' ;

%% Set the indexes of the model 

indexState = containers.Map ; 
switch model
    case 'VANT2.0'
        
        indexState('x') = 1 ; 
        indexState('y') = 2 ;
        indexState('z') = 3 ;
        indexState('roll') = 4 ;
        indexState('pitch') = 5 ;
        indexState('yaw') = 6 ;
        indexState('servoAngleR') = 7 ;
        indexState('servoAngleL') = 8 ;
        indexState('dotx') = 9 ;
        indexState('doty') = 10 ;
        indexState('dotz') = 11;
        indexState('dotroll') = 12;
        indexState('dotpitch') = 13 ;
        indexState('dotyaw') = 14;
        indexState('dotservoR') = 15;
        indexState('dotservoL') = 16;
        indexState('xint') = 17;
        indexState('yint') = 18;
        indexState('zint') = 19;
        indexState('yawint') = 20;
        
    case 'VANT2.0 with load' 
        indexState('x') = 1 ; 
        indexState('y') = 2 ;
        indexState('z') = 3 ;
        indexState('roll') = 4 ;
        indexState('pitch') = 5 ;
        indexState('yaw') = 6 ;
        indexState('x_load_angle')= 7 ; 
        indexState('y_load_angle')= 8 ;       
        indexState('servoAngleR') = 9 ;
        indexState('servoAngleL') = 10 ;
        indexState('dotx') = 11 ;
        indexState('doty') = 12 ;
        indexState('dotz') = 13;
        indexState('dotroll') = 14;
        indexState('dotpitch') = 15 ;
        indexState('dotyaw') = 16;
        indexState('x_load_dotangle') = 17;
        indexState('y_load_dotangle') = 18;
        indexState('dotservoR') = 19;
        indexState('dotservoL') = 20;
        indexState('xint') = 21;
        indexState('yint') = 22;
        indexState('zint') = 23;
        indexState('yawint') = 24;
end 

indexOutput = containers.Map ; 
indexOutput ('Thrustdir') = 1 ; 
indexOutput ('Thrustesq') = 2 ;
indexOutput ('RefaR') = 3 ;
indexOutput ('RefaL') = 4 ;
%% Load the data simulation for SIL, HIL and SIL 

global Struct_array %% the structure which will contain the data of all the simulations  

% s is the substructure template for each simulation type (SIL, MIL and
% HIL) 

s.output=table ; 
s.input=table ; 
s.ref=table ; 
s.err=table ; 
s.time=[] ; 


%% HIL simulation
Struct_array.HIL = s ; 
Struct_array.HIL.input=array2table(csvread('HIL_data\in.txt'))  ; 
Struct_array.HIL.output=array2table( csvread('HIL_data\out.txt')) ;
Struct_array.HIL.err= table ; % not available 
Struct_array.HIL.ref= table ; % not available 
Struct_array.HIL.time=csvread('HIL_data\tIn.txt') ;

%% SIL simulation

Struct_array.SIL = s ;
Struct_array.SIL.input= array2table(csvread('SIL_data\in.txt')) ; 
Struct_array.SIL.output= array2table(csvread('SIL_data\out.txt')) ;
Struct_array.SIL.err= array2table(csvread('SIL_data\erro.txt')) ; 
Struct_array.SIL.ref= array2table(csvread('SIL_data\ref.txt') ) ; 
Struct_array.SIL.time=csvread('SIL_data\tIn.txt');

%% MIL simulation 

if (~exist('state_MIL','var') || ~exist('output_MIL','var') || ~exist('err_MIL','var') || ~exist('ref_MIL','var') || ~exist('timesec','var') || ~exist('timensec','var') )
   MIL_sim =  load('MIL_sim.mat') ; 
   state_MIL = MIL_sim.state_MIL ; 
   output_MIL = MIL_sim.output_MIL ; 
   err_MIL = MIL_sim.err_MIL ; 
   ref_MIL = MIL_sim.ref_MIL ; 
   timesec = MIL_sim.timesec ; 
   timensec  = MIL_sim.timensec ;   
end 

Struct_array.MIL = s ;
Struct_array.MIL.input= array2table(state_MIL) ;  
Struct_array.MIL.output= array2table(output_MIL) ;
Struct_array.MIL.err=  array2table(err_MIL) ;
Struct_array.MIL.ref= array2table(ref_MIL) ; 
Struct_array.MIL.time= timesec +  timensec/10^9 ;



%% Section to create the structure of tables

outputKeys = keys(indexOutput) ; 
stateKeys = keys(indexState) ; 

struct_fields = fieldnames (Struct_array) ;
for k=1:length(struct_fields) %% HIL, SIL ...
    struct_fields{k}  ; 
    
    for i=1:length(stateKeys)
        Struct_array.(struct_fields{k}).input.Properties.VariableNames{indexState(stateKeys{i})} = stateKeys{i};
        if (length(Struct_array.(struct_fields{k}).ref.Properties.VariableNames)==length(stateKeys))
            Struct_array.(struct_fields{k}).ref.Properties.VariableNames{indexState(stateKeys{i})} = stateKeys{i};
        end
        if (length(Struct_array.(struct_fields{k}).err.Properties.VariableNames)==length(stateKeys))
            Struct_array.(struct_fields{k}).err.Properties.VariableNames{indexState(stateKeys{i})} = stateKeys{i};
        end
    end
    
    for i=1:length(outputKeys)
        Struct_array.(struct_fields{k}).output.Properties.VariableNames{indexOutput(outputKeys{i})} = outputKeys{i};
    end
    
end


clear outputKeys stateKeys k i struct_fields s 

%% Save MIL data in a file 

save('MIL_sim','state_MIL','output_MIL','err_MIL','ref_MIL','timesec','timensec') ; 