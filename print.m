function print(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global Struct_array
N = 150 ; 


figure('Name','Position')
subplot(3,1,1)
plot(Struct_array.SIL.time(1:N),Struct_array.SIL.input.position.x(1:N)) ;
hold on
plot(Struct_array.HIL.time(1:N),Struct_array.HIL.input.position.x(1:N)) ;
legend('SIL','HIL') ;
ylabel('x position') ;
subplot(3,1,2)
plot(Struct_array.SIL.time(1:N),Struct_array.SIL.input.position.y(1:N)) ;
hold on
plot(Struct_array.HIL.time(1:N),Struct_array.SIL.input.position.y(1:N)) ;
legend('SIL','HIL') ;
ylabel('y position') ;
subplot(3,1,3)
plot(Struct_array.SIL.time(1:N),Struct_array.SIL.input.position.z(1:N)) ;
hold on
plot(Struct_array.HIL.time(1:N),Struct_array.SIL.input.position.z(1:N)) ;
legend('SIL','HIL') ;
ylabel('z position') ;
 

end

