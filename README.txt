This folder contains matlab scripts to analyse the ProVant controllers. 
It is also able to run a Model in the loop simulation with simulink models interfaced with Gazebo. 

Differents types of simulations can studied : 
    * SIL et HIL simulation where data are provided by the ProVant Simulator
    * MIL simulation where the data are provided by the simulink simulation 

********* read data *************** 

The Data_reader.m script read data from files to format them in order to easily get the desired data. 
For exemple if you want to compare the UAV trajectory in SIL mode and HIL mode. 

The SIL and the HIL data are respectively in the SIL_data and HIL_dat folder.
Put your data here to analyse them. 

The MIL data are in some .mat files : 
    * erro.mat
    * outputs.mat
    * timensec.mat
    * timesec.mat 
    * X.mat 

****** analyse data ***************

Some matlab scripts have been written for each simulation or to compare them each other. 
    * analyse_MIL.m 
    * analyse_SIL.m
    * analyse_SIL_MIL.m
    * analyse_SIL_MIL.m

All of them use the simplot function which allow to easily plot data in the them figure for analyse. 
Take a look at these scripts to understand how it works. 

****** Model in the loop (MIL) *********** 
The robotics system toolbox of simulink provide ROS block to interface simulink with a ROS server. 
So you can design your controller on simulink and test it with the Gazebo model of the Vant. 
Warning ! : Before running the simulation add the simulator_msgs type to matlab. Actually this ROS message type have desgined by the ProVant Group
and is not known by matlab.(see the following website for help : https://www.mathworks.com/help/robotics/ug/ros-custom-message-support.html) 

Two controllers have been designed for now : 
    * Vant2_lqr.slx run the LQR controller for the Vant2 without load. Run the Vant2_lqr.m script to set the parameters 
    * Vant2_Hinf_withLoad.slx run the hinfinite controller for the Vant2 with load. Run the Vant2_Hinf_withLoad.m script to set the parameters. 
