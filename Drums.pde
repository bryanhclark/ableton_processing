ArrayList<DrumRect> DRUM_NOTES = new ArrayList<DrumRect>();
int NUM_DRUMS = 16;
int DRUM_RACK_OFFSET = 36;

// x, width, color, isOn
class DrumRect {
  float xPos, yPos, rectHeight, rectWidth;
  int[] rgb;
  boolean isOn;
  DrumRect (float x, float w, int[] rgbArr, boolean initOn) {
    xPos = x;
    yPos = height;
    rectWidth = w;
    rectHeight = 0;
    rgb = rgbArr;
    isOn = initOn;
  }

  void show(float velocity) {
    println("velocity: "+velocity);
    isOn = true;
    float a = velocity / 127;
    println("a: "+a);
    rectHeight = a * height;
    println("rectHeight: "+rectHeight);
  }

  void hide() {
    isOn = false;
  }
}

void initDrums() {
  for(int i = 0; i < NUM_DRUMS; i = i + 1) {
    float a = (float)i/NUM_DRUMS;
    int xInit = floor(a * width);
    int wInit = floor(width / NUM_DRUMS);
    int[] rgbInit = { 255, 100, 10 };
    boolean isOnInit = true;
    DrumRect drum = new DrumRect(xInit, wInit,rgbInit, isOnInit);
    DRUM_NOTES.add(drum);
  }
}

void drawDrums() {
  for(int i = 0; i < NUM_DRUMS; i ++) {
    DrumRect drum = DRUM_NOTES.get(i);
    if (drum.isOn) {
      fill(drum.rgb[0], drum.rgb[1], drum.rgb[2]);
      rect(drum.xPos, drum.yPos, drum.rectWidth, -drum.rectHeight);
    }
  }
}

void drumNoteOn(int note, int velocity) {
  int offsetNote = note - DRUM_RACK_OFFSET;
  DrumRect drum = DRUM_NOTES.get(offsetNote);
  drum.show(velocity);
}

void drumNoteOff(int note) {
  int offsetNote = note - DRUM_RACK_OFFSET;
  DrumRect drum = DRUM_NOTES.get(offsetNote);
  drum.hide();
}

