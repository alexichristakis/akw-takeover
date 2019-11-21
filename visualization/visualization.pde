import oscP5.*;
import netP5.*;

OscP5 oscP5;

String val;

AlexiViz alexiViz;

int alexiData = 0;
int danielData = 0;
int[] samData = {0, 0, 0};
int sarimData = 0;
int[] sabrinaData = {0, 0};

void setup() {
  size(720, 480);

  oscP5 = new OscP5(this, 44444);   //listening

  alexiViz = new AlexiViz();
  sarimViz = new sarimViz();
}

void draw() {
  // here we can switch between each of our classes
  alexiViz.draw(alexiData, danielData, samData, sarimData, sabrinaData);
  sarimViz.draw(alexiData, danielData, samData, sarimData, sabrinaData);
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
