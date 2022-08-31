import themidibus.*;

MidiBus myBus;

int x = 0;

void setup() {
  fullScreen(2);
  background(0);
  initDrums();

  MidiBus.list();

  myBus = new MidiBus(this, 1, 1);
}


void draw() {
  background(0);
  drawDrums();

}

void controllerChange(int channel, int number, int value) {
  println("channel: "+channel);
  println("number: "+number);
  println("value: "+value);
}

void noteOn(int channel, int number, int value) {
  if (channel == 0) {
    drumNoteOn(number, value);
  }
}

void noteOff(int channel, int number, int value) {
  if (channel == 0) {
    drumNoteOff(number);
  }
}
