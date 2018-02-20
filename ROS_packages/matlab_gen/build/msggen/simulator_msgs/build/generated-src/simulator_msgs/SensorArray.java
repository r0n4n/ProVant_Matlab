package simulator_msgs;

public interface SensorArray extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "simulator_msgs/SensorArray";
  static final java.lang.String _DEFINITION = "Header header\nstring name\nSensor[] values\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  java.lang.String getName();
  void setName(java.lang.String value);
  java.util.List<simulator_msgs.Sensor> getValues();
  void setValues(java.util.List<simulator_msgs.Sensor> value);
}
