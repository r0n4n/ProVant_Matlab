%% connecting to the ros server 

rosinit('192.168.98.150') ; 

%%
rosshutdown 

%% 

rostopic list

%% subscriter creation

estados = rossubscriber('/Estados') 

%% 
scandata = receive(estados) 
state = scandata.Values 
%%
sub = rossubscriber('/Estados',@ROSTurtleXCallback) 
%%
scan = sub.LatestMessage

%%

scandata = receive(sub,10) 
values = scandata.Values
%% 
msg = rostopic('echo','/SensoraL') 
