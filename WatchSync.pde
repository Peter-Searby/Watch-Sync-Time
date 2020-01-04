/**
 * Simple Write. 
 * 
 * Check if the mouse is over a rectangle and writes the status to the serial port. 
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;
import java.nio.ByteBuffer;

Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port

void setup() 
{
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  long t = System.currentTimeMillis()/1000;
  ByteBuffer buffer = ByteBuffer.allocate(Long.BYTES);
  buffer.putLong(t);
  myPort.write("T"+String.valueOf(t));
  exit();
}
