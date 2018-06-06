/**
 */

String[] gender_population = {"male", "female"};
float[] gender_data = {77.9, 22.1};

float[] whole_gender_data = {52.5, 47.5};

String[] race_ethnicity_population = {"White", "Asian", "Black", "Hispanic", "Other"};
float[] race_ethnicity_data = {59.1, 30.1, 5.1, 3.9, 1.8};

float[] whole_race_ethnicity_data = {66.9, 5.5, 10.8, 14.9, 1.9};

color[] palette = {#ff9e80, #ade470, #00695c, #4dd0e1, #ffff8d};


PFont font;


String[] lines;
int index = 0;

int dim;

void setup() {
  size(750, 500);
  dim = height / 100;
  background(0);
  stroke(255);
  frameRate(12);
  lines = loadStrings("positions.txt");
  font = createFont("data/ArialMT-48.vlw", 15);
  textFont(font);
  drawKey(race_ethnicity_population);
  draw();

}
int x = 250;
int y = 0;


void draw() {
  println(height);
  if (index < race_ethnicity_population.length) {
    int data = int(whole_race_ethnicity_data[index] * 100);
    color c = palette[index];
    fill(c);
    stroke(0);
    for (int i = 0; i < data; i++) {
      if (x == width) {
        x = 250;
        y += dim;
      }
      rect(x, y, dim, dim);
      x += dim;
    }
    // Go to the next line for the next run through draw()
    index = index + 1;
  }
}

void drawKey(String[] keyData) {
    stroke(255);
    fill(255);
    rect(25, 25, 150, 50);
    stroke(0);
    fill(0);
    text("Key:", 50, 50);

  for (int i = 0; i < keyData.length; i++) {
    String data = keyData[i];
    color c = palette[i];
    stroke(c);
    fill(c);
    rect(25, (i * 50) + 75, 150, 50);
    stroke(0);
    fill(0);
    text(data, 50, ((i+2) * 50));
  }
}