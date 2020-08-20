import processing.serial.*;
import java.nio.ByteBuffer;
import java.time.OffsetDateTime;
import java.time.temporal.ChronoField;

Serial myPort;  // Create object from Serial class

void setup() 
{
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  long t = OffsetDateTime.now().getLong(ChronoField.OFFSET_SECONDS)+System.currentTimeMillis()/1000;
  ByteBuffer buffer = ByteBuffer.allocate(Long.BYTES);
  buffer.putLong(t);
  myPort.write("T"+String.valueOf(t));
  exit();
}
