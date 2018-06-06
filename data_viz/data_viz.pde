/**
 * Visualizing representation in tech
 */

// Population breakdowns given in US Census Bureau under
// software engineering 
String[] gender_population = {"male", "female"};
float[] gender_data = {77.9, 22.1};

// For all of the US
float[] whole_gender_data = {52.5, 47.5};

// Population breakdowns given in US Census Bureau under
// software engineering 
String[] race_ethnicity_population = {"White", "Asian", "Black", "Hispanic", "Other"};
float[] race_ethnicity_data = {59.1, 30.1, 5.1, 3.9, 1.8};

// For all of the US
float[] whole_race_ethnicity_data = {66.9, 5.5, 10.8, 14.9, 1.9};

// Color palette assumes we only have 5 data points
color[] palette = {#ff9e80, #ade470, #00695c, #4dd0e1, #ffff8d};


PFont font;
int index;
int dim; // dimensions of our squares

void setup() {
  // draw the canvas; should be a square with an extra 250
  // pixels in the length for the key
  size(750, 500);
  // set the dimensions of our squares to be 1/100 of the height
  dim = height / 100;
  // make background black
  background(0);
  
  stroke(255);
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

// Draws the key in the leftmost 250 pixels
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