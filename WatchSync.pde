import processing.serial.*;
import java.nio.ByteBuffer;

Serial myPort;  // Create object from Serial class

void setup() 
{
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  long t = System.currentTimeMillis()/1000;
  ByteBuffer buffer = ByteBuffer.allocate(Long.BYTES);
  buffer.putLong(t);
  myPort.write("T"+String.valueOf(t));
  exit();
}
