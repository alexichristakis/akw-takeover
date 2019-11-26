# "Starting a fire" in AKW

The idea for this sensor was born out of two factors: (1) a desire for students in AKW (Arthur K. Watson Hall, Yale's Computer Science building) to interact with the sensor and (2) the availability of pre-machined materials in the requisite shapes. The enclosure contains two sensors: a capacitive touch sensor as the "fire starter" stick and a piezo sensor underneath the fire.

To interact with the piece, the user rubs the fire starter stick between their hands, with the motion one might use when actually starting a fire. The ESP32 then sends the duration of time that the sensor has been touched to the mesh network. The piezo sensor is hidden. It acts as a measure of the amount of vibration occurring from the fire starting motion. The piezo value (0-4095) is sent directly to the mesh network. 

![Fire Sensor](./docs/sab-enclosure.jpg)

Video demo on YouTube: https://youtu.be/lH3Er2HlccU

### Design Concept

![All Sensors](./docs/all-sensors.jpg)

For this module, I actually created the enclosure for the sensors before I finalized which sensors I was going to incorporate. This time around, function followed form. I thought that only including a capacitive touch sensor would be too simplistic, so I added in the piezo sensor as a hidden sensing component. The fire design of my enclosure inspired our group's subsequent "elements" theme.

### Enclosure

Materials
- 3/4 inch diameter wooden dowel
- Wooden panel (roughly 8x8)
- Wooden blocks (x4) to elevate
- Matboard or thick paper
- Tinfoil
- Paint
- Hot glue
- Wire (solid and string)

Assembly
1. To create the wooden base, drill a 7/8 inch diameter hole through the center of the wooden panel. The hole does not have to be exactly 7/8, it just needs to be large enough to accommodate the wooden dowel and a single wire when rubbed.
2. Glue the four wooden blocks to each corner of the wooden base. The wooden blocks can be any length and width, but should be tall enough to accommodate an ESP32 and wires coming in and out. Hot glue a piece of matboard to the wooden blocks (only glue 2/4 sides, so that the ESP32 can be placed in / taken out). 
3. Cover the wooden rod in tinfoil and wrap some of the stranded wire inside the tinfoil. Leave about a foot of wire hanging out from one end, so that it can be tucked underneath the wooden board into the ESP32.
4. Cut pieces of matboard into flames and hot glue to the surface of the enclosure. Paint as a campfire.

### Sensors & Electronics

![Piezo Sensor Setup](./docs/sab-piezo.jpg)

Materials
- Piezo sensor
- ESP32

const int piezoPin = 32;
const int touchPin = 27;

Assembly
1. The majority of the sensor assembly is detailed above. All that needs to be done for this last step is to hot glue the piezo underneath the opening in the wood board, so that the rod will be right above it.
2. Attach all wires to the ESP32. Make sure that the capacitive touch sensor wire is attached to a touch pin (refer to wiring diagrams if necessary). I used 27 for the touch sensor and 32 for the piezo.

### Technical challenges

There were no technical challenges while creating the sensor enclosure and setup. I have used these sensor types on an ESP32 previously, and was familiar with the required steps. The main technical challenges for this module were related to creating and deploying the mesh network. In particular, we struggled with incorporating two Raspberry Pi's into our ESP32 PainlessMesh network. 

It was also difficult to test the full simulation. Even though we had a python simulator that would send OSC messages to Processing, simulating the behavior of the real installation, we encountered issues during the presentation because we hadn't been able to test whether Processing would be able to receive the messages over WiFi, when run on the Raspberry Pi. In the future, we would definitely need to test our network topology more rigorously before deploying, as well as creating backup visualizations and data inputs in case of failure.
