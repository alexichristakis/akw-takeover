import oscP5.*;
import netP5.*;

OscP5 oscP5;

String val;

AlexiViz alexiViz;
SarimViz sarimViz;
SabsViz sabsViz;

int alexiData = 0;
int danielData = 0;
int sarimData = 0;
int[] samData = {0, 0, 0};
int[] sabrinaData = {0, 0};

void setup() {
  size(720, 480);

  oscP5 = new OscP5(this, 44444);   //listening

  alexiViz = new AlexiViz();
  sarimViz = new SarimViz();
  sabsViz = new SabsViz();
}

int frame = 0;
int framesPer = 3600 * 4;
void draw() {

  //// here we can switch between each of our classes
  //if (frame < framesPer) {
  //  alexiViz.draw(alexiData, danielData, samData, sarimData, sabrinaData);
  //} else if (frame < framesPer * 2) {
  //  sarimViz.draw(alexiData, danielData, samData, sarimData, sabrinaData);
  //} else if (frame < framesPer * 3) {
  //  // daniel
  //} else if (frame < framesPer * 4) {
    sabsViz.draw(alexiData, danielData, samData, sarimData, sabrinaData);
  //} else {
  //  frame = 0;
  //}

  frame++;
  println(frame);

}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  val = theOscMessage.get(0).stringValue();

  String[] parsed = val.split("--");
  try {
    switch(parsed[0]) {
      case "sarim": {
        sarimData = int(parsed[1]);
        break;
      }

      case "daniel": {
        danielData = int(parsed[1]);
        break;
      }

      case "alexi": {
        alexiData = int(parsed[1]);
        break;
      }

      case "sabrina": {
        sabrinaData[0] = int(parsed[1]);
        sabrinaData[1] = int(parsed[2]);
        break;
      }

      case "sam": {
        samData[0] = int(parsed[1]);
        samData[1] = int(parsed[2]);
        samData[2] = int(parsed[3]);
        break;
      }

      default:
        break;
    }
  } catch(Exception e) {
    println("ERROR: unexpected message");
  }
}
