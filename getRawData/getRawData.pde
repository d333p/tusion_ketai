//required for BT enabling on startup
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;

import android.bluetooth.BluetoothAdapter;
import ketai.ui.*;

import oscP5.*;
import com.neurosky.thinkgear.*;

BluetoothAdapter bluetoothAdapter;
TGDevice tgDevice;

String info = "";
KetaiList klist;

int connected, connecting, notPaired, disconnected, cantFind;
int attention, meditation, blink;

PVector remoteMouse = new PVector();

ArrayList<String> devicesDiscovered = new ArrayList();
boolean isConfiguring = true;
String UIText;
float j = 0;
int raw = 0;
float oldj = 0;
int oldraw = 0;

boolean btState;
final boolean rawEnabled = false;

//********************************************************************
// The following code is required to enable bluetooth at startup.
//********************************************************************


//********************************************************************

void setup()
{   
  orientation(PORTRAIT);
  background(78, 93, 75);
  stroke(255);
  textSize(24);

   
  bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
  if (bluetoothAdapter == null) {
    btState = false;
  } else {
    /* create the TGDevice */
    tgDevice = new TGDevice(bluetoothAdapter, handler);
    btState = true;
  }
}

void draw()
{ 
  fill(attention * 2);
  ellipse(50, 50, 200 + meditation * 20, 200 + 10 * attention);

  drawUI();
  
  if (btState) {
    if (tgDevice.getState() != TGDevice.STATE_CONNECTING && tgDevice.getState() != TGDevice.STATE_CONNECTED) {
      tgDevice.connect(rawEnabled);
    }
  }
}



void onDestroy() {
  tgDevice.close();
}