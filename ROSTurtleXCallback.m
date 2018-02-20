function ROSTurtleXCallback(~, message)
    %exampleHelperROSChatterCallback - ROS subscriber callback function to display data
    %   from the message.
    %   exampleHelperROSChatterCallback(~,MESSAGE) returns no arguments- it simply displays
    %   message content.
    %   
    %   See also ROSPublishAndSubscribeExample
    
    %   Copyright 2014 The MathWorks, Inc.
    
    disp('X position Callback message data: ');
    message.Header.Seq
end