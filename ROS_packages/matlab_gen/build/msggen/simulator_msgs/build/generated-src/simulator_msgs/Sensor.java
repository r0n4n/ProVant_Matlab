package simulator_msgs;

public interface Sensor extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "simulator_msgs/Sensor";
  static final java.lang.String _DEFINITION = "Header header\nstring name\nfloat64[] values\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  java.lang.String getName();
  void setName(java.lang.String value);
  double[] getValues();
  void setValues(double[] value);
}
