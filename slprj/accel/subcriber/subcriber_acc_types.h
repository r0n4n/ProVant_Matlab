#include "__cf_subcriber.h"
#ifndef RTW_HEADER_subcriber_acc_types_h_
#define RTW_HEADER_subcriber_acc_types_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#ifndef _DEFINED_TYPEDEF_FOR_SL_Bus_ROSVariableLengthArrayInfo_
#define _DEFINED_TYPEDEF_FOR_SL_Bus_ROSVariableLengthArrayInfo_
typedef struct { uint32_T CurrentLength ; uint32_T ReceivedLength ; }
SL_Bus_ROSVariableLengthArrayInfo ;
#endif
#ifndef _DEFINED_TYPEDEF_FOR_SL_Bus_subcriber_ros_time_Time_
#define _DEFINED_TYPEDEF_FOR_SL_Bus_subcriber_ros_time_Time_
typedef struct { int32_T Sec ; int32_T Nsec ; }
SL_Bus_subcriber_ros_time_Time ;
#endif
#ifndef _DEFINED_TYPEDEF_FOR_SL_Bus_subcriber_std_msgs_Header_
#define _DEFINED_TYPEDEF_FOR_SL_Bus_subcriber_std_msgs_Header_
typedef struct { uint32_T Seq ; uint8_T FrameId [ 128 ] ; uint8_T sl_padding0
[ 4 ] ; SL_Bus_ROSVariableLengthArrayInfo FrameId_SL_Info ;
SL_Bus_subcriber_ros_time_Time Stamp ; } SL_Bus_subcriber_std_msgs_Header ;
#endif
#ifndef _DEFINED_TYPEDEF_FOR_SL_Bus_subcriber_simulator_msgs_Sensor_
#define _DEFINED_TYPEDEF_FOR_SL_Bus_subcriber_simulator_msgs_Sensor_
typedef struct { uint8_T Name [ 128 ] ; SL_Bus_ROSVariableLengthArrayInfo
Name_SL_Info ; real_T Values [ 20 ] ; SL_Bus_ROSVariableLengthArrayInfo
Values_SL_Info ; SL_Bus_subcriber_std_msgs_Header Header ; }
SL_Bus_subcriber_simulator_msgs_Sensor ;
#endif
typedef struct bq0jrq5ffm_ bq0jrq5ffm ;
#endif
